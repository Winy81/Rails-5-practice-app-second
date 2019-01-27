class User < ApplicationRecord
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
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
  def self.digest(string) #for test as a test user from pull out test/fixtures/users.yml
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
