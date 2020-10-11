class Review < ApplicationRecord
  belongs_to :episode
  belongs_to :user
  enum private_status: {公開:0, 非公開:1}

  raryrate_rateable "評価"
end
