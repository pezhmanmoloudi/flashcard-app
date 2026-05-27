import type { RouteRecordRaw } from 'vue-router'
import { ROUTE_NAMES } from '../route-names'

export const settingsRoutes: RouteRecordRaw[] = [
  {
    path: 'settings',
    name: ROUTE_NAMES.SETTINGS,
    component: () => import('@/pages/settings/SettingsPage.vue'),
    meta: { title: 'Settings' },
  },
]
