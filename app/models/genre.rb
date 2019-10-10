class Genre < ApplicationRecord

	has_many :cds
	accepts_nested_attributes_for :cds
	validates :genre, uniqueness: true
end
