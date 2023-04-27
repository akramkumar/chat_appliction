class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :conversations, foreign_key: "user1_id"
  has_many :conversations, foreign_key: "user2_id"
  has_many :messages,foreign_key: :user_id
  scope :list_user, -> (user) { where.not(id:user) }
end
