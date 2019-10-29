class ReviewsController < ApplicationController

	before_action :sign_in?

	def index
	end

	def create
		cd = Cd.find(params[:cd_id])
		review = current_user.reviews.new(review_params)
		review.cd_id = cd.id
        if review.save
    	else
    		flash[:notice] = "レビューは空で投稿できません。"
    		redirect_to cd_path(cd.id)
    	end
    	@reviews = cd.reviews
	end

	def destroy
		review = Review.find(params[:cd_id])
		cd = review.cd
		review.delete
		@reviews = cd.reviews
	end

    private
    def review_params
    	params.require(:review).permit(:user_id, :cd_id, :body)
    end

    def sign_in?
    	if user_signed_in?
    	else
    		redirect_to new_user_session_path
    	end
    end
end
