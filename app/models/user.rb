class User < ApplicationRecord
  has_secure_password
  
  has_many :likes
  
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
end
