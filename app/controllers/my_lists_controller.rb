class MyListsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = current_user
    anime = Anime.find(params[:anime_id])
    if MyList.create(user_id: user.id,anime_id: anime.id)
    redirect_to anime_path(anime)
    else
      redirect_to root_url
    end

  end

  def destroy
    user = current_user
    anime = Anime.find(params[:anime_id])
    if my_list = MyList.find_by(user_id: user.id, anime_id: anime.id)
      my_list.delete
      redirect_to anime_path(anime)
    else
      redirect_to root_url
    end
  end
end