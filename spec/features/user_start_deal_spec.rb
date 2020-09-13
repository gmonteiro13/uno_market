require 'rails_helper'

feature 'User view products' do
    scenario 'succesfully' do
        user = User.create!(email: 'biel@nintendo.com', password: '123456')
        user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
        login_as user

        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos', description: 'Jogo de aventura do SNES', price: 100, user: user_2, status: :available)
        
        visit root_path
        click_on 'Ver todos os produtos'
        click_on 'Ver'
        click_on 'Comprar'
        click_on 'Iniciar compra'

        expect(product.deal).to be_open
        expect(product.reload).to be_unavailable
    end
end