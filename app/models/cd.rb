class Cd < ApplicationRecord
	belongs_to :genre
	belongs_to :label
	belongs_to :sales_status
	belongs_to :artist

	has_many :disces
	accepts_nested_attributes_for :disces
	has_many :arrivals
	accepts_nested_attributes_for :arrivals

	validates :genre_id, presence: true
	validates :label_id, presence: true
	validates :sales_status_id, presence: true
	validates :artist_id, presence: true
	validates :cd_name, presence: true
	validates :price, presence: true
	validates :stock, presence: true
end
