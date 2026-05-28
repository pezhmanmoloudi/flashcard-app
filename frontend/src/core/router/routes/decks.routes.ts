import type { RouteRecordRaw } from 'vue-router'
import { ROUTE_NAMES } from '../route-names'

export const deckRoutes: RouteRecordRaw[] = [
  {
    path: 'dashboard',
    name: ROUTE_NAMES.DASHBOARD,
    component: () => import('@/pages/decks/DashboardPage.vue'),
    meta: { title: 'Dashboard' },
  },
  {
    path: 'decks',
    name: ROUTE_NAMES.DECKS,
    component: () => import('@/pages/decks/DeckListPage.vue'),
    meta: { title: 'My Decks' },
  },
  {
    path: 'decks/new',
    name: ROUTE_NAMES.DECK_NEW,
    component: () => import('@/pages/decks/DeckNewPage.vue'),
    meta: { title: 'New Deck' },
  },
  {
    path: 'decks/:id',
    name: ROUTE_NAMES.DECK_SHOW,
    component: () => import('@/pages/decks/DeckDetailPage.vue'),
    meta: { title: 'Deck' },
  },
  {
    path: 'decks/:id/edit',
    name: ROUTE_NAMES.DECK_EDIT,
    component: () => import('@/pages/decks/DeckEditPage.vue'),
    meta: { title: 'Edit Deck' },
  },
]
