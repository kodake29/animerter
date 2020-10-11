class ReviewsController < ApplicationController

    def new
      @review = Review.new
    end

    def create
      @anime = Anime.find(params[:anime_id])
      @episode = Episode.find(params[:episode_id])
      @review = Review.new(review_params)
      @review.episode_id = @episode.id
      @review.user_id = current_user.id
      @review.save
      redirect_to anime_episode_path(@anime, @episode)
    end

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
      params.require(:review).permit(:episode_id, :user_id, :rate, :comment, :release_status, :private_status)
    end
end