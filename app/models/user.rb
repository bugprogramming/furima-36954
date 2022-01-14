class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :imagess
 has_many :purchases
       
 validates :birthday, presence: true
 validates :last_name_jpn, presence: true
 validates :first_name_jpn, presence: true
 validates :last_name, presence: true
 validates :first_name_name, presence: true  
 validates :nickname, presence: true 
 validates :email, presence: true
end
