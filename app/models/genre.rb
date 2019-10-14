class Genre < ApplicationRecord

	has_many :cds
	validates :genre, uniqueness: true

	def self.search_all(search)
    Genre.find_by(['genre LIKE ?', "#{search}"])
  	end
end
