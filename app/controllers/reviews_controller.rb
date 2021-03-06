class ReviewsController < ApplicationController

    def new
      @review = Review.new

    end

    def create
      @episode = Episode.find(params[:episode_id])
      @anime = Anime.find(params[:anime_id])
      @reviews = Review.page(params[:page]).where(episode_id: @episode.id, release_status: 0, private_status: 0).reverse_order.per(6)
      #@reviews = Review.where(episode_id: @episode.id, release_status: 0, private_status: 0)
      @review = Review.new(review_params)
      @review.episode_id = @episode.id
      @review.user_id = current_user.id
      @review.save
      p @review.errors
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
      @user = current_user
      @anime = Anime.find(params[:anime_id])
      @episode = Episode.find(params[:episode_id])
      @review = Review.find(params[:id])
      if @review.update(review_params)
         redirect_to user_path(@user)
      else
        render :edit
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