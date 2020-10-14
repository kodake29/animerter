class Anime < ApplicationRecord
  attachment :image
  has_many :episodes, dependent: :destroy
  has_many :my_lists, dependent: :destroy
  has_many :users, through: :my_lists

  enum display_status: {公開:0, 非公開:1}

  # マイリスト追加済みにログインユーザが含まれるか

end
