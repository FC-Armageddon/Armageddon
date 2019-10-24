class Cd < ApplicationRecord
	belongs_to :genre
	belongs_to :label
	belongs_to :sales_status
	belongs_to :artist

	has_many :discs, dependent: :destroy
	accepts_nested_attributes_for :discs, allow_destroy: true
	has_many :arrivals
	has_many :carts
	has_many :reviews, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	attachment :jacket_image

	validates :genre_id, presence: true
	validates :label_id, presence: true
	validates :sales_status_id, presence: true
	validates :artist_id, presence: true
	validates :cd_name, presence: true
	validates :price, presence: true
	validates :stock, presence: true
end
