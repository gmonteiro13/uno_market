class Profile < ApplicationRecord
    belongs_to :user
    validates :full_name, presence: true, format: {with: /[a-zA-Z]/, message: 'Insira apenas caracteres válidos'}
    validates :social_name, presence: true, format: {with: /[a-zA-Z]/, message: 'Insira apenas caracteres válidos'}
    validates :birth_date, presence: true
    validates :job, presence: true, format: {with: /[a-zA-Z]/, message: 'Insira apenas caracteres válidos'}
    validates :department, presence: true, format: {with: /[a-zA-Z]/, message: 'Insira apenas caracteres válidos'}

end
