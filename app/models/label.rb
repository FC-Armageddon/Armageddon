class Label < ApplicationRecord

	has_many :cds

	def self.search_all(search)
    Label.find_by(['label LIKE ?', "#{search}"])
  	end
end
