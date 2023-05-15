require 'bcrypt'
class User < ApplicationRecord
  include BCrypt

  has_many :movies, dependent: :destroy

  validates :email, email: true, presence: true
  validates :encrypted_password, presence: true

  def password
    @password ||= Password.new encrypted_password
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end
end
