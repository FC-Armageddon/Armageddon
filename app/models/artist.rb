class Artist < ApplicationRecord

	has_many :cds

	validates :artist, presence: true
end
