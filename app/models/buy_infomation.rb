class BuyInfomation < ApplicationRecord

    belongs_to :user
    has_many :purchase_histories

	validates :user_id, presence: true
	validates :payment, presence: true
	validates :delivery_status, presence: true
	validates :subtotal, presence: true
	validates :final_postal_code, presence: true
	validates :final_address, presence: true
	validates :final_name, presence: true

	enum payment: [ :cash, :cod ]
	enum delivery_status: [ :reception, :preparing, :delivered ]
end
