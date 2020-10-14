class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum display_status: {有効会員:0, 退会:1}

         has_many :reviews, dependent: :destroy
         has_many :requests
         has_many :my_lists, dependent: :destroy
         has_many :animes, through: :my_lists


end
