class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  scope :request_category, -> (category) {
    if category != "none"
      find(category.to_i)
    else
      ""
    end
  }
  
  def self.search(words)
    where(["name like?", "%#{words}%"])
  end
end