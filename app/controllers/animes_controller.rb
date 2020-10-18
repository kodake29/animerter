class AnimesController < ApplicationController

  def index
    @animes = Anime.page(params[:page]).reverse_order.where(display_status: 0)
    @episodes = Episode.all
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def search
    selection = params[:keyword]
    @animes = Anime.sort(selection)
 end

end
