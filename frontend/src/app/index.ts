import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from '@/App.vue'
import { router } from '@/core/router'
import { setupInterceptors } from '@/core/api/interceptors'
import { useAuthStore } from '@/core/stores/auth.store'

export async function bootstrap() {
  const app = createApp(App)
  const pinia = createPinia()

  app.use(pinia)
  app.use(router)

  setupInterceptors()

  await router.isReady()
  await useAuthStore().initialize()

  return app
}
