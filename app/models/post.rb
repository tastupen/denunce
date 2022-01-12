class Post < ApplicationRecord
  
  enum status: { public: 0, private: 1 }, _prefix: true
  
  scope :display_list, -> (category, status) {
    if category != "none"
      where(category_id: category).status_public.order(created_at: :desc)
    else
      status_public.order(created_at: :desc)
    end
  }
  
  belongs_to :category
  
  has_many :likes, dependent: :destroy
end
