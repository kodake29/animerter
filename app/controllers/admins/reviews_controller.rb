class Admins::ReviewsController < ApplicationController

  def index
    @reviews = Review.page(params[:page]).reverse_order
    end

    def show
      @review = Review.find(params[:id])

    end

    def edit
      @review = Review.find(params[:id])
    end

    def update
      @review = Review.find(params[:id])
      if @review.update(review_params)
         redirect_to admins_reviews_path
      else
        redirect_to root_path
      end
    end

    private
    def review_params
      params.require(:review).permit(:episode_id, :user_id, :evaluation, :comment, :release_status, :private_status)
    end
end


