class Category < ApplicationRecord
  has_many :posts
  
  scope :request_category, -> (category) {
    if category != "none"
      find(category.to_i)
    else
      ""
    end
  }
end
