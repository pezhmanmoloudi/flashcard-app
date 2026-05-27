module JsonWebToken
  SECRET = Rails.application.secret_key_base
  EXPIRY  = 24.hours

  TokenExpiredError = Class.new(StandardError)
  InvalidTokenError = Class.new(StandardError)

  def self.encode(payload)
    payload = payload.merge(exp: EXPIRY.from_now.to_i)
    JWT.encode(payload, SECRET, "HS256")
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET, true, algorithm: "HS256").first
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::ExpiredSignature
    raise TokenExpiredError, "Token has expired"
  rescue JWT::DecodeError
    raise InvalidTokenError, "Invalid token"
  end
end
