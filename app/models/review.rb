class Review < ApplicationRecord
  belongs_to :episode
  belongs_to :user
  enum private_status: {公開:0, プライベート:1}
  enum release_status: {許可:0, 非公開:1}

  validates :rate, presence: true
  validates :comment, length: { maximum: 100 }
end
