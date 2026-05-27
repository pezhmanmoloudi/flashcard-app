import './types'
import { createRouter, createWebHistory } from 'vue-router'
import { routes } from './routes'
import { authGuard } from './guards/auth.guard'

export const router = createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior: () => ({ top: 0 }),
})

router.beforeEach(authGuard)

router.afterEach((to) => {
  document.title = to.meta.title ? `${to.meta.title} — Flashcard App` : 'Flashcard App'
})
