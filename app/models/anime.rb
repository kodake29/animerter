class Anime < ApplicationRecord
  attachment :image
  has_many :episodes, dependent: :destroy
  enum display_status: {公開:0, 非公開:1}
end
