class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_one :deal

  validates :product_name, presence: true
  validates :category, presence: true
  validates :description, presence: true

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, message: 'Preço precisa ser maior ou igual a R$ 1,00' }

  enum status: { available: 0, unavailable: 5, sold: 10 }
end