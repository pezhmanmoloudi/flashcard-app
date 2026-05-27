import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from '@/App.vue'
import { router } from '@/core/router'
import { setupInterceptors } from '@/core/api/interceptors'

export function bootstrap() {
  const app = createApp(App)
  const pinia = createPinia()

  app.use(pinia)
  app.use(router)

  setupInterceptors()

  return app
}
