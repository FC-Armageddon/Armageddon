class Song < ApplicationRecord

	belongs_to :disc

	validates :song, presence: true
	validates :song_order, presence: true
end
