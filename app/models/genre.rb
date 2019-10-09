class Genre < ApplicationRecord

	has_many :cds
	validates :genre, uniqueness: true
end
