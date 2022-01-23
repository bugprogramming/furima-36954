class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #has_many :images
 #has_many :purchases
       
 validates :birthday, presence: true
 validates :nickname, presence: true 
 VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数を両方含む必要があります"}

 with_options presence: true do
 validates :last_name_jpn, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"}
 validates :first_name_jpn, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"}
 validates :last_name, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角のみで入力して下さい"}
 validates :first_name, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角のみで入力して下さい"}  
 end
end


