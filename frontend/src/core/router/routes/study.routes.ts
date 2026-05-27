import type { RouteRecordRaw } from 'vue-router'
import { ROUTE_NAMES } from '../route-names'

export const studyRoutes: RouteRecordRaw[] = [
  {
    path: 'study',
    name: ROUTE_NAMES.STUDY,
    component: () => import('@/pages/study/StudySessionPage.vue'),
    meta: { title: 'Study' },
  },
]
