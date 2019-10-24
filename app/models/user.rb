class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :carts
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :buy_informations
  has_many :destinations, dependent: :destroy
  accepts_nested_attributes_for :destinations, allow_destroy: true

  with_options presence: true do
  	validates :postal_code
  	validates :address
  	validates :phone_number
  	validates :first_name
  	validates :last_name
  	validates :kana_first_name, format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "は全角カタカナのみで入力して下さい"
                 }
  	validates :kana_last_name, format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "は全角カタカナのみで入力して下さい"
                 }
  end

  with_options uniqueness: true do
  	validates :phone_number
  	validates :email
  end

end
