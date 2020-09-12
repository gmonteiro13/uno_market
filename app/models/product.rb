class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_one :deal
end
