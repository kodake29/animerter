class HomesController < ApplicationController

  def top
    @animes = Anime.where(display_status: 0).sample(6)
    @reviews = Review.where(release_status: 0, private_status: 0).last(6).reverse
  end

  def about
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
