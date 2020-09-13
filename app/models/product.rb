class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_one :deal

  enum status: { available: 0, unavailable: 5, sold: 10 }
end