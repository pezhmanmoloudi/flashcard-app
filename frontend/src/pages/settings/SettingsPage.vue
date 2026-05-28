<script setup lang="ts">
import { BasePageHeader } from '@/shared/components/ui'
import { useAuthStore } from '@/core/stores/auth.store'
import ProfileInfoCard from '@/features/settings/components/ProfileInfoCard.vue'
import EmailUpdateCard from '@/features/settings/components/EmailUpdateCard.vue'
import PasswordUpdateCard from '@/features/settings/components/PasswordUpdateCard.vue'

const authStore = useAuthStore()
</script>

<template>
  <div>
    <BasePageHeader
      title="Settings"
      description="Manage your account information."
    />

    <div class="space-y-4 max-w-lg">
      <ProfileInfoCard
        v-if="authStore.user"
        :user="authStore.user"
      />

      <EmailUpdateCard />

      <PasswordUpdateCard />
    </div>
  </div>
</template>
