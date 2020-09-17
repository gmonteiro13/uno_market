require 'rails_helper'

feature 'User comments on a product' do
    scenario 'succesfully' do
        user = User.create!(email: 'biel@nintendo.com', password: '123456')
        user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
        profile = Profile.create!(full_name: 'Gabriel Soares Cardoso Monteiro', social_name: 'Gabriel Monteiro', 
        birth_date: '14/12/1994', job: 'Level Designer', department: 'Jogos', user: user)
        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos', description: 'Jogo de aventura do SNES', price: 100, user: user_2, status: :available)
        
        login_as user
        visit root_path
        click_on 'Ver todos os produtos'
        click_on "Ver #{product.product_name}"
        fill_in 'comment_body', with: 'Comentário de teste'
        click_on 'Comentar'

        expect(page).to have_content('Comentário de teste')
        expect(page).to have_content("Enviado a menos de um minuto atrás por #{user.profile.social_name}")
    end
end