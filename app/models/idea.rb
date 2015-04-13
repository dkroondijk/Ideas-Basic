class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_many :joins, dependent: :destroy
  has_many :joined_users, through: :joins, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  # code for paperclip image uploading
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
