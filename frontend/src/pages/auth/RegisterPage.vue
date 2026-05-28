<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/core/stores/auth.store'
import { ROUTE_NAMES } from '@/core/router/route-names'

const router = useRouter()
const authStore = useAuthStore()

const email = ref('')
const password = ref('')
const passwordConfirmation = ref('')
const error = ref<string | null>(null)

async function submit() {
  error.value = null
  try {
    await authStore.register({
      email: email.value,
      password: password.value,
      password_confirmation: passwordConfirmation.value,
    })
    router.push({ name: ROUTE_NAMES.DECKS })
  } catch (e: unknown) {
    error.value =
      (e as { response?: { data?: { error?: string } } })?.response?.data?.error ??
      'Registration failed. Please try again.'
  }
}
</script>

<template>
  <div>
    <h2 class="text-lg font-semibold text-gray-900 mb-6">
      Create account
    </h2>

    <form
      class="space-y-4"
      @submit.prevent="submit"
    >
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
        <input
          v-model="email"
          type="email"
          required
          autocomplete="email"
          placeholder="you@example.com"
          class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
        >
      </div>

      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
        <input
          v-model="password"
          type="password"
          required
          autocomplete="new-password"
          placeholder="••••••••"
          class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
        >
      </div>

      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">Confirm password</label>
        <input
          v-model="passwordConfirmation"
          type="password"
          required
          autocomplete="new-password"
          placeholder="••••••••"
          class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
        >
      </div>

      <p
        v-if="error"
        class="text-sm text-red-600"
      >
        {{ error }}
      </p>

      <button
        type="submit"
        :disabled="authStore.loading"
        class="w-full bg-gray-900 text-white text-sm font-medium py-2 rounded-lg hover:bg-gray-700 transition-colors disabled:opacity-50"
      >
        {{ authStore.loading ? 'Creating account…' : 'Create account' }}
      </button>
    </form>

    <p class="mt-4 text-center text-sm text-gray-500">
      Already have an account?
      <RouterLink
        :to="{ name: ROUTE_NAMES.AUTH_LOGIN }"
        class="text-gray-900 font-medium hover:underline"
      >
        Sign in
      </RouterLink>
    </p>
  </div>
</template>
