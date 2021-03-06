class User < ApplicationRecord
  before_save { self.email = email.downcase } # alter object before_save

  has_many :articles, dependent: :destroy # any associaterd dependents (articles) will be destoryed as well
  
  validates :username, 
    presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, 
    presence: true, 
    uniqueness: { case_sensitive: false },  
    length: { maximum: 105 },
    format: { with: VALID_EMAIL_REGEX }

  has_secure_password

end