class Arrival < ApplicationRecord

	belongs_to :cd

	validates :arrival, presence: true
end
