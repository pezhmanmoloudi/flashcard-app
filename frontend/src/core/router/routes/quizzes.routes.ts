import type { RouteRecordRaw } from 'vue-router'
import { ROUTE_NAMES } from '../route-names'

export const quizRoutes: RouteRecordRaw[] = [
  {
    path: 'quiz',
    name: ROUTE_NAMES.QUIZZES,
    component: () => import('@/pages/quizzes/QuizPage.vue'),
    meta: { title: 'Quiz' },
  },
]
