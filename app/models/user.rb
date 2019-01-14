class User < ApplicationRecord
	validates(:name, presence: true)
	validates(:name, length: { minimum: 5 })
    validates(:name, length: { maximum: 50 })
    validates(:email, presence: true)
    validates(:email, length: { minimum: 8 })
    validates(:email, length: { maximum: 255 })
    validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
end
