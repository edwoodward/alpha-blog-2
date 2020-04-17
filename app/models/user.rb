class User < ApplicationReacord
  validates :username, presence: true, uniqueness: {case_sensiticwe: false}, length: {minimum: 3, maximum:25}
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  validates :email, presence: true, uniqueness: {case_sensiticwe: false}, length: {maximum:105}, format: {with: VALID_EMAIL_FORMAT}

end