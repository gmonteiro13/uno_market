class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :profile
  has_many :products
  has_many :deals
  has_many :comments

  before_create :set_company

  private

  def set_company
    self.company = self.email.split("@").last.split(".").first.capitalize!
  end

end
