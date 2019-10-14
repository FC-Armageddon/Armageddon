class SalesStatus < ApplicationRecord

	has_many :cds
	
	validates :sales_status, presence: true, uniqueness: true

	def self.search_all(search)
    SalesStatus.find_by(['sales_status LIKE ?', "#{search}"])
  	end
end
