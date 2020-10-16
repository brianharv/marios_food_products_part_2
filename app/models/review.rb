class Review < ApplicationRecord
  belongs_to :product dependent: :destroy
  validates :author, :content_body, :rating, presence: true
end  