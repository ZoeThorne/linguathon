class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :user_words
  has_many :words, through: :user_words
  has_many :trainings

  has_many :user_achievements
  has_many :achievements, though: :user_achievements

  has_streak
end
