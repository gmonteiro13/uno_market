require 'rails_helper'

feature 'User view products' do
    scenario 'succesfully' do
        user = User.create!(email: 'biel@nintendo.com', password: '123456')
        user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
        login_as user

        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos',
                                  description: 'Jogo de aventura do SNES', price: 100, user: user_2)

        
        visit root_path

        click_on 'Ver todos os produtos'
        
        expect(page).to have_content('Donkey Kong Country 2')
        expect(page).to have_content('Jogos')
        expect(page).to have_content('Jogo de aventura do SNES')
        expect(page).to have_content('100')
        expect(page).to have_content(user_2.company)
    end

    scenario 'must be logged in to view details' do
        visit root_path
        click_on 'Ver todos os produtos'

        expect(page).to have_content('Para continuar, faça login ou registre-se')
    end

    scenario 'but does not view products from a different company' do
        viewer_user = User.create!(email: 'biel@nintendo.com', password: '123456')
        sony_user = User.create!(email: 'tiago@sony.com', password: '654321')
        nintendo_user = User.create!(email: 'pedro@nintendo.com', password: '987654')

        sony_product = Product.create!(product_name: 'Dualshock PS2', category: 'Periférico',
                                  description: 'Controle do PS2', price: 30, user: sony_user)
        nintendo_product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos',
                                    description: 'Jogo de aventura do SNES', price: 100, user: nintendo_user)
  
        login_as viewer_user
        visit root_path
        click_on 'Ver todos os produtos'

        expect(page).not_to have_content('Dualshock PS2')
        expect(page).not_to have_content('Periférico')
        expect(page).not_to have_content('Controle do PS2')
        expect(page).not_to have_content('30')
        expect(page).not_to have_content(sony_user.company)

        expect(page).to have_content('Donkey Kong Country 2')
        expect(page).to have_content('Jogos')
        expect(page).to have_content('Jogo de aventura do SNES')
        expect(page).to have_content('100')
        expect(page).to have_content(nintendo_user.company)
    end
end