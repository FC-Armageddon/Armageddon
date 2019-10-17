class PurchaseHistory < ApplicationRecord
	
	belongs_to :buy_information

	validates :buy_information_id, presence: true
	validates :cd_name, presence: true
	validates :price, presence: true
end
