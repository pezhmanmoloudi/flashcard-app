import type { RouteRecordRaw } from 'vue-router'
import { ROUTE_NAMES } from '../route-names'

export const authRoutes: RouteRecordRaw[] = [
  {
    path: 'login',
    name: ROUTE_NAMES.AUTH_LOGIN,
    component: () => import('@/pages/auth/LoginPage.vue'),
    meta: { title: 'Login' },
  },
  {
    path: 'register',
    name: ROUTE_NAMES.AUTH_REGISTER,
    component: () => import('@/pages/auth/RegisterPage.vue'),
    meta: { title: 'Create Account' },
  },
]
