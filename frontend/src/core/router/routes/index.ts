import type { RouteRecordRaw } from 'vue-router'
import { ROUTE_NAMES } from '../route-names'
import { authRoutes } from './auth.routes'
import { deckRoutes } from './decks.routes'
import { flashcardRoutes } from './flashcards.routes'
import { studyRoutes } from './study.routes'
import { quizRoutes } from './quizzes.routes'
import { settingsRoutes } from './settings.routes'

export const routes: RouteRecordRaw[] = [
  {
    path: '/',
    component: () => import('@/layouts/AppLayout.vue'),
    meta: { requiresAuth: true },
    children: [
      {
        path: '',
        redirect: { name: ROUTE_NAMES.DECKS },
      },
      ...deckRoutes,
      ...flashcardRoutes,
      ...studyRoutes,
      ...quizRoutes,
      ...settingsRoutes,
    ],
  },
  {
    path: '/auth',
    component: () => import('@/layouts/AuthLayout.vue'),
    meta: { requiresGuest: true },
    children: authRoutes,
  },
  {
    path: '/:pathMatch(.*)*',
    name: ROUTE_NAMES.NOT_FOUND,
    component: () => import('@/pages/NotFoundPage.vue'),
  },
]
