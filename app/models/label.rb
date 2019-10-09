class Label < ApplicationRecord

	has_many :cds
	validates :quantity, uniqueness: true
end
