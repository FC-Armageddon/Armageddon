class BuyInformation < ApplicationRecord

    belongs_to :user
    has_many :purchase_histories

	validates :user_id, presence: true
	validates :payment, presence: true
	validates :subtotal, presence: true
	validates :final_postal_code, presence: true
	validates :final_address, presence: true
	validates :final_name, presence: true

	enum payment: {cash: 0, cod: 1}
	enum delivery_status: {reception: 1, preparing: 2, delivered: 3}
end
