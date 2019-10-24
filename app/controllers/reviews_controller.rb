class ReviewsController < ApplicationController

	before_action :authenticate_user!

	def index
	end

	def create
		@review = Review.new(review_params)
		user = current_user
		cd = Cd.find(params[:id])
		body = current_user.reviews.new(review_params)
		body.cd_id = cd.id
        body.save
        redirect_to cd_path(cd.id)
	end

	def destroy
		
	end

    private
    def review_params
    	params.require(:review).permit(:user_id, :cd_id, :body)
    end
end
