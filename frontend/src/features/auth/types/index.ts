export interface AuthUser {
  id: number
  email: string
}

export interface LoginCredentials {
  email: string
  password: string
}

export interface RegisterCredentials {
  email: string
  password: string
  password_confirmation: string
}

export interface AuthApiResponse {
  data: {
    token: string
    user: AuthUser
  }
}
