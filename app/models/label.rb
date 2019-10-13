class Label < ApplicationRecord

	has_many :cds
	accepts_nested_attributes_for :cds
	
	validates :quantity, uniqueness: true

	def self.search_all(search)
    Label.find_by(['label LIKE ?', "#{search}"])
  	end
end
