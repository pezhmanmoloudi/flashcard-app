<script setup lang="ts">
import { BaseCard, BaseInput, BaseButton, BaseAlert } from '@/shared/components/ui'
import { useAuthStore } from '@/core/stores/auth.store'
import { useUpdateEmail } from '../composables/useUpdateEmail'

const authStore = useAuthStore()
const { email, loading, error, success, isDirty, submit } = useUpdateEmail(
  authStore.user?.email ?? '',
)

async function handleSubmit() {
  const updatedUser = await submit()
  if (updatedUser) {
    authStore.setUser(updatedUser)
  }
}
</script>

<template>
  <BaseCard>
    <h2 class="text-sm font-semibold text-gray-900 mb-4">
      Update email
    </h2>

    <form
      class="space-y-4"
      @submit.prevent="handleSubmit"
    >
      <BaseInput
        v-model="email"
        label="New email address"
        type="email"
        placeholder="you@example.com"
        autocomplete="email"
        :required="true"
      />

      <BaseAlert
        v-if="error"
        variant="error"
        :message="error"
      />

      <BaseAlert
        v-if="success"
        variant="success"
        message="Email updated successfully."
      />

      <BaseButton
        type="submit"
        :loading="loading"
        :disabled="!isDirty || loading"
      >
        Save email
      </BaseButton>
    </form>
  </BaseCard>
</template>
