class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :buy_informations
  has_many :destinations

  with_options presence: true do
  	validates :postal_code
  	validates :address
  	validates :phone_number
  	validates :first_name
  	validates :last_name
  	validates :kana_first_name
  	validates :kana_last_name
  end

  with_options uniqueness: true do
  	validates :phone_number
  	validates :email
  end

end
