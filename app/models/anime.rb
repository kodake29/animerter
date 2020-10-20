class Anime < ApplicationRecord
  attachment :image
  has_many :episodes, dependent: :destroy
  has_many :my_lists, dependent: :destroy
  has_many :users, through: :my_lists

  enum display_status: {公開:0, 非公開:1}

  validates :title, length: { in: 1..40 }
  validates :explanation, length: { maximum: 400 }

  def self.search(search)
    if search
      @animes = Anime.where(['title LIKE ?', "%#{search}%"])
    else
      Anime.all
    end
  end

end
