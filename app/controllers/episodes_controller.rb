class EpisodesController < ApplicationController
  def index
    @anime = Anime.find(params[:anime_id])
    @episodes = Episode.where(anime_id: @anime.id)
  end

  def show
    @anime = Anime.find(params[:anime_id])
    @episodes = Episode.where(anime_id: @anime.id)
    @episode = Episode.find(params[:id])
    @reviews = Review.where(episode_id: @episode.id)
  end


end
