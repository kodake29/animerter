class Admins::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    end

    def show
      @review = Review.find(params[:id])

    end

    def edit
      @review = Review.find(params[:id])
    end

    def update
      @review = Review.find(params[:id])
      redirect_to admins_anime_path(@anime)
    end

    private
    def review_params
      params.require(:review).permit(:episode_id, :user_id, :evaluation, :comment, :release_status, :private_status)
    end
end


