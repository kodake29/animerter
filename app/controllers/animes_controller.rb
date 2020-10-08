class AnimesController < ApplicationController
  def show
  end

  def index
    @animes = Anime.all
  end
end
