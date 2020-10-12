class Episode < ApplicationRecord
  attachment :image
  belongs_to :anime
  has_many :reviews


end
