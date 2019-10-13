class SalesStatus < ApplicationRecord

	has_many :cds
	accepts_nested_attributes_for :cds
	
	validates :sales_status, presence: true, uniqueness: true

	def self.search_all(search)
    Sales_status.find_by(['sales_status LIKE ?', "#{search}"])
  	end
end
