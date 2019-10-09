class Arrival < ApplicationRecord

	belongs_to :cd

	validates :arrival, presence: true
	validates :cd_id, presence: true
end
