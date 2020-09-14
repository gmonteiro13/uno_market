require 'rails_helper'

feature 'User view products' do
    scenario 'succesfully' do
        user = User.create!(email: 'biel@nintendo.com', password: '123456')
        user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
        login_as user

        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos', description: 'Jogo de aventura do SNES', price: 100, user: user_2, status: :available)
        
        visit root_path
        click_on 'Ver todos os produtos'
        click_on "Ver #{product.product_name}"
        click_on 'Comprar'
        click_on 'Iniciar compra'

        expect(product.deal).to be_open
        expect(product.reload).to be_unavailable
    end

    scenario 'does not view unavailable products' do
        user = User.create!(email: 'biel@nintendo.com', password: '123456')
        user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
        login_as user

        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos', description: 'Jogo de aventura do SNES', price: 100, user: user_2, status: :available)
        product_2 = Product.create!(product_name: 'Shinobi III', category: 'Jogos', description: 'Jogo com trilha sonora fantástica', price: 80, user: user_2, status: :available)

        visit root_path
        click_on 'Ver todos os produtos'
        click_on "Ver #{product.product_name}"
        click_on 'Comprar'
        click_on 'Iniciar compra'
        click_on 'Voltar'
        
        expect(product.reload).to be_unavailable
        expect(page).not_to have_content('Donkey Kong Country 2')
        expect(page).to have_content('Shinobi III')
    end
end