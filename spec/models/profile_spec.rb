require 'rails_helper'

RSpec.describe Profile, type: :model do
    context 'validation' do
        it 'attributes cannot be blank' do
            profile = Profile.new

            profile.valid?

            expect(profile.errors[:full_name]).to include('não pode ficar em branco')
            expect(profile.errors[:social_name]).to include('não pode ficar em branco')
            expect(profile.errors[:birth_date]).to include('não pode ficar em branco')
            expect(profile.errors[:job]).to include('não pode ficar em branco')
            expect(profile.errors[:department]).to include('não pode ficar em branco')
        end
    end
end



