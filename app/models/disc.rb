class Disc < ApplicationRecord

	has_many :songs

	belongs_to :cd
	
	validates :cd_id, presence: true
end
