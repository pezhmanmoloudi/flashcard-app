<script setup lang="ts">
import { useRouter, useRoute } from 'vue-router'
import { useAuthStore } from '@/core/stores/auth.store'
import { ROUTE_NAMES } from '@/core/router/route-names'

const router = useRouter()
const route = useRoute()
const authStore = useAuthStore()

const navLinks = [
  { name: ROUTE_NAMES.STUDY,    label: 'Study' },
  // { name: ROUTE_NAMES.QUIZZES,  label: 'Quiz' }, // temporarily hidden
  { name: ROUTE_NAMES.SETTINGS, label: 'Settings' },
]

function isActive(routeName: string) {
  return route.matched.some((r) => r.name === routeName)
}

function logout() {
  authStore.logout()
  router.push({ name: ROUTE_NAMES.AUTH_LOGIN })
}
</script>

<template>
  <div class="min-h-screen bg-[var(--color-surface-alt)] flex flex-col">
    <header class="bg-white border-b border-[var(--color-border)] sticky top-0 z-10">
      <nav class="max-w-4xl mx-auto px-4 h-14 flex items-center justify-between">

        <!-- Left: brand -->
        <RouterLink
          :to="{ name: ROUTE_NAMES.DASHBOARD }"
          class="font-semibold text-[var(--color-text)] tracking-tight text-sm"
        >
          Flashcard App
        </RouterLink>

        <!-- Right: Library + main nav + logout -->
        <div class="flex items-center gap-0.5">
          <RouterLink
            :to="{ name: ROUTE_NAMES.DECKS }"
            class="px-3 py-1.5 rounded-lg text-sm transition-colors"
            :class="
              isActive(ROUTE_NAMES.DECKS)
                ? 'bg-[var(--color-primary-light)] text-[var(--color-primary)] font-medium'
                : 'text-gray-500 hover:text-gray-800 hover:bg-gray-100'
            "
          >
            Library
          </RouterLink>

          <RouterLink
            v-for="link in navLinks"
            :key="link.name"
            :to="{ name: link.name }"
            class="px-3 py-1.5 rounded-lg text-sm transition-colors"
            :class="
              isActive(link.name)
                ? 'bg-[var(--color-primary-light)] text-[var(--color-primary)] font-medium'
                : 'text-gray-500 hover:text-gray-800 hover:bg-gray-100'
            "
          >
            {{ link.label }}
          </RouterLink>

          <button
            class="ml-2 px-3 py-1.5 rounded-lg text-sm text-gray-400 hover:text-gray-700 hover:bg-gray-100 transition-colors"
            @click="logout"
          >
            Logout
          </button>
        </div>
      </nav>
    </header>

    <main class="flex-1 max-w-4xl mx-auto w-full px-4 py-8">
      <RouterView />
    </main>
  </div>
</template>
