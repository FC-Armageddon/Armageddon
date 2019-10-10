class SalesStatus < ApplicationRecord

	has_many :cds
	accepts_nested_attributes_for :cds
	
	validates :sales_status, presence: true

	enum sales_status: [ :sold, :preparing, :sold_out ]
end
