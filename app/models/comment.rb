class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :text_comments, presence: true, length: { minimum: 2 } 
end
