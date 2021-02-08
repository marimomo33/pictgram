class User < ApplicationRecord
    
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  #メールアドレスの型
    VALID_PASSWORD_REGEX=/\A(?=.*?[a-z])[a-z\d]{8,32}+\z/               #アルファベットと数字の混合
  validates :name, presence: true,length:{maximum: 15}                  #nameの最大は15
  validates :email, presence: true,format:{with:VALID_EMAIL_REGEX}      #emailはメールアドレスの型で
 
  has_secure_password validations: false
  
  validates_confirmation_of :password, allow_blank: true, on: :update   #??
  validates :password, presence: true,                                  
  length:{ minimum: 8, maximum: 32},format:{with:VALID_PASSWORD_REGEX}  #passwordの長さは8～32かつアルファベットと数字の混合
  
    has_many :topics
  
end
