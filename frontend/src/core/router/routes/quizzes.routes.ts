import type { RouteRecordRaw } from 'vue-router'
import { ROUTE_NAMES } from '../route-names'

// Quiz feature is temporarily disabled. To reactivate:
// 1. Restore the component below (remove the redirect)
// 2. Uncomment the Quiz nav item in AppLayout.vue
export const quizRoutes: RouteRecordRaw[] = [
  {
    path: 'quiz',
    name: ROUTE_NAMES.QUIZZES,
    redirect: { name: ROUTE_NAMES.DASHBOARD },
    // component: () => import('@/pages/quizzes/QuizPage.vue'),
    // meta: { title: 'Quiz' },
  },
]
