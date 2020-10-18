class Anime < ApplicationRecord
  attachment :image
  has_many :episodes, dependent: :destroy
  has_many :my_lists, dependent: :destroy
  has_many :users, through: :my_lists

  enum display_status: {公開:0, 非公開:1}

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    # when 'good'
    #   return all.order(anime.episode.count: :DESC)
    end
  end

end
