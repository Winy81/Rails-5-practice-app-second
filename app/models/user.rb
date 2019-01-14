class User < ApplicationRecord
	validates(:name, presence: true)
	validates(:name, length: { minimum: 5 })
  validates(:name, length: { maximum: 50 })
  validates(:email, presence: true)
  validates(:email, length: { minimum: 8 })
  validates(:email, length: { maximum: 255 })
end
