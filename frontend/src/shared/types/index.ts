export interface ApiResponse<T> {
  data: T
  meta?: PaginationMeta
}

export interface PaginationMeta {
  current_page: number
  total_pages: number
  total_count: number
  per_page: number
}

export interface ApiError {
  message: string
  errors?: Record<string, string[]>
}
