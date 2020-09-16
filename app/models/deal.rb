class Deal < ApplicationRecord
  belongs_to :product
  belongs_to :user

  enum status: { open: 0, cancelled: 5, closed: 10 }

end
