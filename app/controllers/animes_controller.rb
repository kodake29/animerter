class AnimesController < ApplicationController

  def index
    @animes = Anime.where(display_status: 0)
    @episodes = Episode.all
  end

  def show
    @anime = Anime.find(params[:id])
  end

end
