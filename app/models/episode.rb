class Episode < ApplicationRecord
  attachment :image
  belongs_to :anime
  has_many :reviews

  validates :episode_number, presence: true
  validates :subtitle, length: { in: 1..40 }
  validates :explanation, length: { maximum: 200 }


end
