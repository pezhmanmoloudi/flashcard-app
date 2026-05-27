<script setup lang="ts">
</script>

<template>
  <div class="min-h-screen bg-gray-50 flex flex-col items-center justify-center px-4">
    <div class="mb-8 text-center">
      <h1 class="text-2xl font-semibold text-gray-900 tracking-tight">
        Flashcard App
      </h1>
      <p class="mt-1 text-sm text-gray-500">
        Learn smarter with spaced repetition
      </p>
    </div>

    <div class="w-full max-w-sm bg-white rounded-xl border border-gray-200 shadow-sm p-6">
      <RouterView />
    </div>
  </div>
</template>
