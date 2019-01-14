class User < ApplicationRecord
	before_save { email.downcase! }
	validates(:name, presence: true)
	validates(:name, length: { minimum: 5 })
    validates(:name, length: { maximum: 50 })
    validates(:email, presence: true)
    validates(:email, length: { minimum: 8 })
    validates(:email, length: { maximum: 255 })
    validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates(:email, uniqueness:{ case_sensitive: false })
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
