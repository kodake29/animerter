class Admins::EpisodesController < ApplicationController

  def new
    @episode = Episode.new
  end

  def create
    @anime = Anime.find(params[:anime_id])
    @episode = Episode.new(episode_params)
    @episode.anime_id = @anime.id
    @episode.save
    redirect_to admins_anime_path(@anime)
  end

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def edit
    @anime = Anime.find(params[:anime_id])
    @episode = Episode.find(params[:id])
  end

  def update
    @episode = Episode.find(params[:id])
    @anime = @episode.anime_id
    @episode.update(episode_params)
    redirect_to admins_animes_path
  end

  private
  def episode_params
    params.require(:episode).permit(:subtitle, :explanation, :anime_id, :episode_number, :image)
end




end
