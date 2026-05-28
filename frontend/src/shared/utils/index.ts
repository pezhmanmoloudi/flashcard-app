export function formatDate(date: string | Date): string {
  return new Date(date).toLocaleDateString()
}

export function formatRelativeDate(date: string | Date): string {
  const d = new Date(date)
  const now = new Date()
  const diffDays = Math.floor((now.getTime() - d.getTime()) / (1000 * 60 * 60 * 24))

  if (diffDays === 0) return 'Today'
  if (diffDays === 1) return 'Yesterday'
  return `${diffDays} days ago`
}

type ApiErrorShape = { response?: { data?: { error?: string } } }

export function extractError(e: unknown, fallback = 'Something went wrong'): string {
  return (e as ApiErrorShape)?.response?.data?.error ?? fallback
}
