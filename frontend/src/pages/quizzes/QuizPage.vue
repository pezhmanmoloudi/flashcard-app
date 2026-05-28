<script setup lang="ts">
import { BasePageHeader, BaseEmptyState } from '@/shared/components/ui'
</script>

<template>
  <div>
    <BasePageHeader
      title="Quiz"
      description="Test your knowledge."
    />

    <BaseEmptyState
      title="No quizzes available"
      description="Add flashcards to your decks to unlock quizzes."
    />
  </div>
</template>
