class Profile < ApplicationRecord
    belongs_to :user
    validates :full_name, presence: true
    validates :social_name, presence: true
    validates :birth_date, presence: true
    validates :job, presence: true
    validates :department, presence: true

end
