class ReviewsController < ApplicationController

    def new
      @review = Review.new
      @episode = Episode.find(params[:id])
    end

    def create
      @anime = Anime.find(params[:anime_id])
      @episode = Episode.find(params[:episode_id])
      @review = Review.new(review_params)
      @review.episode_id = @episode.id
      @review.user_id = current_user.id
      if @review.save
         redirect_to anime_episode_path(@anime, @episode)
      else
        redirect_to anime_episode_path(@anime, @episode)
      end
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
      @anime = Anime.find(params[:anime_id])
      @episode = Episode.find(params[:episode_id])
      @review = Review.find(params[:id])
      if @review.update(review_params)
         redirect_to anime_episode_path(@anime, @episode)
      else
        redirect_to root_path
      end
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to user_path(current_user)
    end

    private
    def review_params
      params.require(:review).permit(:anime_id, :episode_id, :rate, :comment, :release_status, :private_status)
    end
end