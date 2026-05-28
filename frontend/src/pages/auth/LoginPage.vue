<script setup lang="ts">
import { ref } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useAuthStore } from '@/core/stores/auth.store'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseInput, BaseButton, BaseAlert } from '@/shared/components/ui'

const router = useRouter()
const route = useRoute()
const authStore = useAuthStore()

const email = ref('')
const password = ref('')
const error = ref<string | null>(null)

async function submit() {
  error.value = null
  try {
    await authStore.login({ email: email.value, password: password.value })
    const redirect = route.query.redirect as string | undefined
    router.push(redirect ?? { name: ROUTE_NAMES.DECKS })
  } catch (e: unknown) {
    error.value =
      (e as { response?: { data?: { error?: string } } })?.response?.data?.error ??
      'Login failed. Please try again.'
  }
}
</script>

<template>
  <div>
    <h2 class="text-lg font-semibold text-gray-900 mb-6">
      Sign in
    </h2>

    <form
      class="space-y-4"
      @submit.prevent="submit"
    >
      <BaseInput
        v-model="email"
        label="Email"
        type="email"
        placeholder="you@example.com"
        autocomplete="email"
        :required="true"
      />

      <BaseInput
        v-model="password"
        label="Password"
        type="password"
        placeholder="••••••••"
        autocomplete="current-password"
        :required="true"
      />

      <BaseAlert
        v-if="error"
        :message="error"
      />

      <BaseButton
        type="submit"
        :loading="authStore.loading"
        :full-width="true"
      >
        {{ authStore.loading ? 'Signing in…' : 'Sign in' }}
      </BaseButton>
    </form>

    <p class="mt-4 text-center text-sm text-gray-500">
      No account?
      <RouterLink
        :to="{ name: ROUTE_NAMES.AUTH_REGISTER }"
        class="text-[var(--color-primary)] font-medium hover:underline"
      >
        Create one
      </RouterLink>
    </p>
  </div>
</template>
