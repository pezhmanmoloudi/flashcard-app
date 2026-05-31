import type { RouteRecordRaw } from 'vue-router'
import { ROUTE_NAMES } from '../route-names'

export const studyRoutes: RouteRecordRaw[] = [
  {
    path: 'study',
    name: ROUTE_NAMES.STUDY,
    component: () => import('@/pages/study/StudySessionPage.vue'),
    meta: { title: 'Study' },
  },
  {
    path: 'study/review/:languagePair',
    name: ROUTE_NAMES.REVIEW_SESSION,
    component: () => import('@/pages/study/StudyActivePage.vue'),
    meta: { title: 'Review' },
  },
  {
    path: 'study/:deckId',
    name: ROUTE_NAMES.STUDY_SESSION,
    component: () => import('@/pages/study/StudyActivePage.vue'),
    meta: { title: 'Study Session' },
  },
]
