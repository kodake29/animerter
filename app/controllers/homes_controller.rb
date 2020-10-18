class HomesController < ApplicationController

  def top
    @animes = Anime.where(display_status: 0).sample(6)
    @reviews = Review.page(params[:page]).reverse_order.where(release_status: 0, private_status: 0)
  end

  def about
  end

end
