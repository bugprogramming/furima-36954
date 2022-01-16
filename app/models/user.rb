class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #has_many :images
 #has_many :purchases
       
 validates :birthday, presence: true
 validates :last_name_jpn, presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"}
 validates :first_name_jpn, presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"}
 validates :last_name, presence: true, format: { with:/\A[一-龥ぁ-ん]/, message: "全角のみで入力して下さい"}
 validates :first_name, presence: true,  format: { with:/\A[一-龥ぁ-ん]/, message: "全角のみで入力して下さい"}  
 validates :nickname, presence: true 
 VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数を両方含む必要があります"}
 validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: true
end


