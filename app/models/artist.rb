class Artist < ApplicationRecord

	has_many :cds
	accepts_nested_attributes_for :cds

	validates :artist, presence: true
end
