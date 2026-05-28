import { ref, computed } from 'vue'
import type { PaginationMeta } from '@/shared/types'

export function usePagination() {
  const meta = ref<PaginationMeta | null>(null)

  const currentPage = computed(() => meta.value?.current_page ?? 1)
  const totalPages = computed(() => meta.value?.total_pages ?? 1)
  const totalCount = computed(() => meta.value?.total_count ?? 0)
  const hasNextPage = computed(() => currentPage.value < totalPages.value)
  const hasPrevPage = computed(() => currentPage.value > 1)

  function setMeta(newMeta: PaginationMeta) {
    meta.value = newMeta
  }

  return { meta, currentPage, totalPages, totalCount, hasNextPage, hasPrevPage, setMeta }
}
