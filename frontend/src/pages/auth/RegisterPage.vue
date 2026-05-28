<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/core/stores/auth.store'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseInput, BaseButton, BaseAlert } from '@/shared/components/ui'

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
    router.push({ name: ROUTE_NAMES.DASHBOARD })
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
        autocomplete="new-password"
        :required="true"
      />

      <BaseInput
        v-model="passwordConfirmation"
        label="Confirm password"
        type="password"
        placeholder="••••••••"
        autocomplete="new-password"
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
        {{ authStore.loading ? 'Creating account…' : 'Create account' }}
      </BaseButton>
    </form>

    <p class="mt-4 text-center text-sm text-gray-500">
      Already have an account?
      <RouterLink
        :to="{ name: ROUTE_NAMES.AUTH_LOGIN }"
        class="text-[var(--color-primary)] font-medium hover:underline"
      >
        Sign in
      </RouterLink>
    </p>
  </div>
</template>
