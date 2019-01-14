class User < ApplicationRecord
	validates(:name, presence: true)
	validates(:name, length: { minimum: 6 })
  validates(:email, presence: true)
end
