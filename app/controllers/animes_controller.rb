class AnimesController < ApplicationController

  before_action :login_check, only: [:index, :show, :search]

  def index
    @animes = Anime.page(params[:page]).reverse_order.where(display_status: 0)
    @episodes = Episode.all
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def search
    @animes = Anime.search(params[:search])
 end

 def login_check
  unless user_signed_in?
    flash[:alert] = "サービスをご利用いただくにはログインが必要です。"
    redirect_to root_path
  end
end

end
