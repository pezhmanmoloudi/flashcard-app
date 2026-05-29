<script setup lang="ts">
import DeckCard from '@/features/flashcards/components/DeckCard.vue'
import type { Deck } from '@/features/flashcards/types'
import type { DeckStats } from '@/features/study/types'

defineProps<{
  decksByLevel: Record<string, Deck[]>
  levels: string[]
  statsMap: Record<number, DeckStats>
}>()
</script>

<template>
  <div class="px-5 pb-5 space-y-6 border-t border-stone-100">
    <div
      v-for="level in levels"
      :key="level"
      class="pt-5"
    >
      <div class="flex items-center gap-3 mb-4">
        <span class="text-xs font-semibold text-stone-400 uppercase tracking-wider">
          {{ level }}
        </span>
        <div class="flex-1 h-px bg-stone-100" />
      </div>
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <DeckCard
          v-for="deck in decksByLevel[level]"
          :key="deck.id"
          :deck="deck"
          :stats="statsMap[deck.id] ?? null"
          variant="dashboard"
        />
      </div>
    </div>
  </div>
</template>
