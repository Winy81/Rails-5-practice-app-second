class User < ApplicationRecord
	before_save { email.downcase! }
	validates(:name, presence: true)
	validates(:name, length: { minimum: 4 })
    validates(:name, length: { maximum: 50 })
    validates(:email, presence: true)
    validates(:email, length: { minimum: 8 })
    validates(:email, length: { maximum: 255 })
    validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates(:email, uniqueness:{ case_sensitive: false })
    has_secure_password
    validates(:password, presence: true, length: { minimum: 5 })

    # Returns the hash digest of the given string.
  def User.digest(string) #for test as a test user from pull out test/fixtures/users.yml
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
