<script setup lang="ts">
</script>

<template>
  <div class="min-h-screen bg-[var(--color-surface-alt)] flex flex-col items-center justify-center px-4 py-12">
    <div class="mb-8 text-center">
      <h1 class="text-2xl font-semibold text-[var(--color-text)] tracking-tight">
        Flashcard App
      </h1>
      <p class="mt-1 text-sm text-[var(--color-text-muted)]">
        Learn smarter with spaced repetition
      </p>
    </div>

    <div class="w-full max-w-sm bg-white rounded-[var(--radius-card)] border border-[var(--color-border)] shadow-sm p-6">
      <RouterView />
    </div>
  </div>
</template>
