class ReviewsController < ApplicationController

	def create
	end

    private
    def review_params
    	params.require(:review).permit(:user_id, :cd_id, :body)
    end
end
