class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avator, AvatorUploader
  validates_presence_of :name, :intro

  has_many :comments, dependent: :destroy
  has_many :restaurants, through: :comments

  # use source to tell rails the source of self define table
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant 

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  def admin?
    self.role == "admin"
  end

  def following?(user)
    return self.followings.include?(user)
  end

end
