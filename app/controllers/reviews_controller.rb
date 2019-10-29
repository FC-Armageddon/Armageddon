class ReviewsController < ApplicationController

	before_action :authenticate_user!

	def index
	end

	def create
		cd = Cd.find(params[:cd_id])
		review = current_user.reviews.new(review_params)
		review.cd_id = cd.id
        if review.save
        redirect_to cd_path(cd.id)
    	else
    		flash[:notice] = "レビューは空で投稿できません。"
    		redirect_to cd_path(cd.id)
    	end
	end

	def destroy
		review = Review.find(params[:cd_id])
		cd = review.cd
		review.delete
		redirect_to cd_path(cd.id)
	end

    private
    def review_params
    	params.require(:review).permit(:user_id, :cd_id, :body)
    end
end
