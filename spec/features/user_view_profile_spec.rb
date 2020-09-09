require 'rails_helper'

feature 'User view profile' do
    scenario 'succesfully' do
        user = User.create!(email: 'biel@ubisoft.com', password: '123456')
        profile = Profile.create!(full_name: 'Gabriel Soares Cardoso Monteiro', social_name: 'Gabriel Monteiro', 
                                  birth_date: '14/12/1994', job: 'Level Designer', department: 'Jogos', user: user)
        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos',
                                  description: 'Jogo de aventura do SNES', price: 100, user: user)
        login_as user

        visit root_path
        
        click_on 'Ver seu perfil'
        expect(page).to have_content('Gabriel Soares Cardoso Monteiro')
        expect(page).to have_content('Gabriel Monteiro')
        expect(page).to have_content('14-12-1994')
        expect(page).to have_content('Level Designer')
        expect(page).to have_content('Jogos')
        expect(page).to have_content('Ubisoft')
        expect(page).to have_link('Donkey Kong Country 2')
    end

    scenario 'and view others' do
        user_1 = User.create!(email: 'biel@ubisoft.com', password: '123456')
        user_2 = User.create!(email: 'tiago@ubisoft.com', password: '123456')
        user_3 = User.create!(email: 'pedro@santaclara.com', password: '123456')
        product = Product.create!(product_name: 'Watch Dogs', category: 'Jogos',
                                  description: 'Jogo de PS4', price: 100, user: user_2)

        profile_1 = Profile.create!(full_name: 'Gabriel Soares Cardoso Monteiro', social_name: 'Gabriel Monteiro', 
                                  birth_date: '14/12/1994', job: 'Level Designer', department: 'Jogos', user: user_1)
        profile_2 = Profile.create!(full_name: 'Tiago Pereira', social_name: 'Tiago', 
                                  birth_date: '26/11/1993', job: 'DJ', department: 'Soundtrack', user: user_2)
        profile_3 = Profile.create!(full_name: 'Roberta Arcoverde', social_name: 'Roberta', 
                                  birth_date: '28/02/1990', job: 'Developer', department: 'Ruby', user: user_3)
        login_as user_1

        visit root_path

        click_on 'Ver todos os perfis'
        expect(page).to have_content('Tiago Pereira')
        expect(page).not_to have_content('Roberta Arcoverde')
    end
end