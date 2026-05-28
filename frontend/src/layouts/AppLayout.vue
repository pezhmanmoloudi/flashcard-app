<script setup lang="ts">
import { useRouter, useRoute } from 'vue-router'
import { useAuthStore } from '@/core/stores/auth.store'
import { ROUTE_NAMES } from '@/core/router/route-names'

const router = useRouter()
const route = useRoute()
const authStore = useAuthStore()

const navLinks = [
  { name: ROUTE_NAMES.DECKS, label: 'Decks' },
  { name: ROUTE_NAMES.STUDY, label: 'Study' },
  { name: ROUTE_NAMES.QUIZZES, label: 'Quiz' },
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
  <div class="min-h-screen bg-gray-50 flex flex-col">
    <header class="bg-white border-b border-gray-200">
      <nav class="max-w-5xl mx-auto px-4 h-14 flex items-center justify-between">
        <RouterLink
          :to="{ name: ROUTE_NAMES.DECKS }"
          class="font-semibold text-gray-900 tracking-tight"
        >
          Flashcard App
        </RouterLink>

        <div class="flex items-center gap-1">
          <RouterLink
            v-for="link in navLinks"
            :key="link.name"
            :to="{ name: link.name }"
            class="px-3 py-1.5 rounded-md text-sm transition-colors"
            :class="
              isActive(link.name)
                ? 'bg-gray-100 text-gray-900 font-medium'
                : 'text-gray-500 hover:text-gray-900 hover:bg-gray-50'
            "
          >
            {{ link.label }}
          </RouterLink>

          <button
            class="ml-4 px-3 py-1.5 rounded-md text-sm text-gray-500 hover:text-gray-900 hover:bg-gray-50 transition-colors"
            @click="logout"
          >
            Logout
          </button>
        </div>
      </nav>
    </header>

    <main class="flex-1 max-w-5xl mx-auto w-full px-4 py-8">
      <RouterView />
    </main>
  </div>
</template>
