class Post < ApplicationRecord
  
  enum status: { public: 0, private: 1 }, _prefix: true
  
  belongs_to :category
end
