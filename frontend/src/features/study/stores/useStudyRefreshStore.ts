import { defineStore } from 'pinia'
import { ref } from 'vue'

/**
 * Lightweight version counter shared between StudyActivePage (producer)
 * and StudySessionPage (consumer).
 *
 * When a "again" review API call resolves, the producer increments inboxVersion.
 * StudySessionPage watches this and re-fetches inbox + queue, which handles the
 * race condition where the background API call completes AFTER the Study tab
 * has already mounted and run its initial onMounted fetch.
 */
export const useStudyRefreshStore = defineStore('studyRefresh', () => {
  const inboxVersion = ref(0)

  function markInboxDirty() {
    inboxVersion.value++
  }

  return { inboxVersion, markInboxDirty }
})
