import type { RouteRecordRaw } from 'vue-router'
import { ROUTE_NAMES } from '../route-names'

export const flashcardRoutes: RouteRecordRaw[] = [
  {
    path: 'decks/:deckId/flashcards/new',
    name: ROUTE_NAMES.FLASHCARD_NEW,
    component: () => import('@/pages/flashcards/FlashcardNewPage.vue'),
    meta: { title: 'New Flashcard' },
  },
  {
    path: 'flashcards/:id/edit',
    name: ROUTE_NAMES.FLASHCARD_EDIT,
    component: () => import('@/pages/flashcards/FlashcardEditPage.vue'),
    meta: { title: 'Edit Flashcard' },
  },
]
