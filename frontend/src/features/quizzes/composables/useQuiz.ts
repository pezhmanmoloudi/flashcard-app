import { ref, computed } from 'vue'
import { quizService } from '../services/quiz.service'
import type { QuizSession, QuizQuestion, GenerateQuizParams, QuizResult } from '../types'

export function useQuiz() {
  const session = ref<QuizSession | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  const currentQuestion = computed<QuizQuestion | null>(() => {
    if (!session.value) return null
    return session.value.questions.find((q) => !q.answered) ?? null
  })

  const answeredCount = computed(() => {
    return session.value?.questions.filter((q) => q.answered).length ?? 0
  })

  const progress = computed(() => {
    const total = session.value?.total_questions ?? 0
    if (total === 0) return 0
    return Math.round((answeredCount.value / total) * 100)
  })

  const isFinished = computed(() => {
    if (!session.value) return false
    return answeredCount.value === session.value.total_questions
  })

  const result = computed<QuizResult | null>(() => {
    if (!session.value) return null
    return {
      totalQuestions: session.value.total_questions,
      correctAnswers: session.value.correct_answers,
      score: session.value.score,
    }
  })

  async function generate(deckId: number, params: GenerateQuizParams = {}) {
    loading.value = true
    error.value = null
    try {
      session.value = await quizService.generate(deckId, params)
    } catch (err: unknown) {
      error.value = extractMessage(err)
    } finally {
      loading.value = false
    }
  }

  async function load(id: number) {
    loading.value = true
    error.value = null
    try {
      session.value = await quizService.get(id)
    } catch (err: unknown) {
      error.value = extractMessage(err)
    } finally {
      loading.value = false
    }
  }

  async function submitAnswer(questionId: number, answer: string) {
    error.value = null
    try {
      const updated = await quizService.submitAnswer(questionId, { answer })
      if (!session.value) return

      const idx = session.value.questions.findIndex((q) => q.id === questionId)
      if (idx !== -1) {
        session.value.questions[idx] = updated
      }

      if (updated.answered_correctly) {
        session.value.correct_answers += 1
      }
    } catch (err: unknown) {
      error.value = extractMessage(err)
    }
  }

  async function complete() {
    if (!session.value) return
    error.value = null
    try {
      session.value = await quizService.complete(session.value.id)
    } catch (err: unknown) {
      error.value = extractMessage(err)
    }
  }

  function reset() {
    session.value = null
    error.value = null
    loading.value = false
  }

  function extractMessage(err: unknown): string {
    if (err && typeof err === 'object' && 'response' in err) {
      const response = (err as { response?: { data?: { error?: string } } }).response
      return response?.data?.error ?? 'An unexpected error occurred'
    }
    return 'An unexpected error occurred'
  }

  return {
    session,
    loading,
    error,
    currentQuestion,
    answeredCount,
    progress,
    isFinished,
    result,
    generate,
    load,
    submitAnswer,
    complete,
    reset,
  }
}
