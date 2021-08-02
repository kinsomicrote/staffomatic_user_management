class User < ApplicationRecord
  has_secure_password
  has_paper_trail on: [:update]

  validates :email,
    presence: true,
    uniqueness: true
end
