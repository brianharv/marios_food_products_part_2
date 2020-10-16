class Product < ApplicationRecord
  has_many :reviews
  validates :name, :cost, :country_of_origin
end  