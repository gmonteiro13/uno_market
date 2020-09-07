require 'rails_helper'

RSpec.describe User, type: :model do
  context 'company' do
    it 'generate on create' do
      user = User.create!(email: 'biel@nintendo.com', password: '123456')

      user.save
      user.reload

      expect(user.company).to be_present
    end
  end
end