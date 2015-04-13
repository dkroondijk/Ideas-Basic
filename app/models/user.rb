class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

end
