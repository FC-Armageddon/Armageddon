class FavoritesController < ApplicationController

	def create
		@cd = Cd.find(params[:cd_id])
		favorite = current_user.favorites.new(cd_id: @cd.id)
		favorite.save
	end

	def destroy
		@cd = Cd.find(params[:cd_id])
		favorite = current_user.favorites.find_by(cd_id: @cd.id)
		favorite.destroy
	end
end
