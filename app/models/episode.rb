class Episode < ApplicationRecord
  attachment :image
  belongs_to :anime
  has_many :reviews

  raryrate_rateable "評価"
end
