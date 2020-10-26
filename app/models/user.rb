class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum withdrawal_status: {有効会員:0, 退会:1}

         has_many :reviews, dependent: :destroy
         has_many :requests
         has_many :my_lists, dependent: :destroy
         has_many :animes, through: :my_lists

         validates :name, length: { in: 1..40 }

  def active_for_authentication?
    super && (self.withdrawal_status == "有効会員" )
  end

end
