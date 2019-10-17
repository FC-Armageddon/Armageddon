class Destination < ApplicationRecord
	belongs_to :user

	validates :delivery_postal_code, presence: true
	validates :delivery_address, presence: true
	validates :delivery_name, presence: true
	validates :user_id, presence: true
end
