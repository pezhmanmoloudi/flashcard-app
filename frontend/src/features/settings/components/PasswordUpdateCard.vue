<script setup lang="ts">
import { BaseCard, BaseInput, BaseButton, BaseAlert } from '@/shared/components/ui'
import { useUpdatePassword } from '../composables/useUpdatePassword'

const {
  currentPassword,
  password,
  passwordConfirmation,
  passwordStrength,
  confirmError,
  loading,
  error,
  success,
  submit,
} = useUpdatePassword()

const strengthConfig = {
  weak: { label: 'Weak', bars: 1, color: 'bg-red-400' },
  fair: { label: 'Fair', bars: 2, color: 'bg-amber-400' },
  strong: { label: 'Strong', bars: 3, color: 'bg-green-500' },
}
</script>

<template>
  <BaseCard>
    <h2 class="text-sm font-semibold text-gray-900 mb-4">
      Change password
    </h2>

    <form
      class="space-y-4"
      @submit.prevent="submit"
    >
      <BaseInput
        v-model="currentPassword"
        label="Current password"
        type="password"
        placeholder="••••••••"
        autocomplete="current-password"
        :required="true"
      />

      <div class="space-y-2">
        <BaseInput
          v-model="password"
          label="New password"
          type="password"
          placeholder="••••••••"
          autocomplete="new-password"
          hint="At least 8 characters"
          :required="true"
        />

        <div
          v-if="password.length > 0"
          class="flex items-center gap-2"
          aria-live="polite"
          :aria-label="`Password strength: ${passwordStrength}`"
        >
          <div class="flex gap-1 flex-1">
            <div
              v-for="n in 3"
              :key="n"
              class="h-1 flex-1 rounded-full transition-colors duration-200"
              :class="
                n <= strengthConfig[passwordStrength].bars
                  ? strengthConfig[passwordStrength].color
                  : 'bg-gray-200'
              "
            />
          </div>
          <span class="text-xs text-gray-500 w-10">
            {{ strengthConfig[passwordStrength].label }}
          </span>
        </div>
      </div>

      <BaseInput
        v-model="passwordConfirmation"
        label="Confirm new password"
        type="password"
        placeholder="••••••••"
        autocomplete="new-password"
        :error="confirmError"
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
        message="Password updated successfully."
      />

      <BaseButton
        type="submit"
        :loading="loading"
        :disabled="loading"
      >
        Update password
      </BaseButton>
    </form>
  </BaseCard>
</template>
