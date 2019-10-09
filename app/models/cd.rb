class Cd < ApplicationRecord
	has_many :genres
	has_many :labels
	has_many :sales_statuses
	has_many :artists

	belongs_to :disc
	belongs_to :arrival

	validates :genre_id, presence: true
	validates :label_id, presence: true
	validates :sales_status_id, presence: true
	validates :artist_id, presence: true
	validates :cd_name, presence: true
	validates :price, presence: true
	validates :stock, presence: true
end
