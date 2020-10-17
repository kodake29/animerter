class HomesController < ApplicationController

  def top
    @animes = Anime.where(display_status: 0).sample(6)
    @reviews = Review.where(release_status: 0, private_status: 0).last(8).reverse
  end

  def about
  end

end
