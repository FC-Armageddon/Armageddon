class Artist < ApplicationRecord

	has_many :cds
	accepts_nested_attributes_for :cds

	validates :artist, presence: true, uniqueness: true

	def self.search_all(search)
    Artist.find_by(['artist LIKE ?', "#{search}"])
  	end
end
