class User < ActiveRecord::Base
  has_many :links
  validates_uniqueness_of :email
  validates :password, length: { minimum: 6 }, allow_nil: true
  has_secure_password

  attr_accessor :password, :confirmation

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
  
end
