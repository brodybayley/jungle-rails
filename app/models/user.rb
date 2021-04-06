class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password) 
    user = User.find_by_email(email.strip.downcase)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
