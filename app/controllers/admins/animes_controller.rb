class Admins::AnimesController < ApplicationController

  def top
    @animes = Anime.all
    @episodes = Episode.all
    @reviews = Review.all
    @users = User.all
    @requests = Request.all
  end


  def new
  @anime = Anime.new
  end

  def create
  @anime = Anime.new(anime_params)
  @anime.save
  redirect_to admins_animes_path
  end

  def index
  @animes = Anime.all
  end

  def show
    @anime = Anime.find(params[:id])
    @episode = Episode.new
    @episodes = Episode.where(anime_id: @anime.id)
  end

  def edit
    @anime = Anime.find(params[:id])
  end

  def update
    @anime = Anime.find(params[:id])
    @anime.update(anime_params)
    redirect_to admins_anime_path(@anime)
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :explanation, :image, :display_status)
  end
end
