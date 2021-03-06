class Review < ApplicationRecord
  belongs_to :product
  validates :author, :content_body, :rating, presence: true
  validates :content_body, length: { in: 50..250 } 
end  