class User < ActiveRecord::Base

  has_secure_password
  validates :password, length: { minimum: 6, maximum: 20 }, on: :create
  has_many :reviews

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => {:case_sensitive => false}




  def self.authenticate_with_credentials (email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
