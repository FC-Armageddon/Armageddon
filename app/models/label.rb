class Label < ApplicationRecord

	has_many :cds
	accepts_nested_attributes_for :cds
	
	validates :quantity, uniqueness: true
end
