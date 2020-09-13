require 'rails_helper'

feature 'User search products' do
    scenario 'succesfully' do
        user = User.create!(email: 'biel@nintendo.com', password: '123456')
        user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
        profile_2 = Profile.create!(full_name: 'Tiago Pereira', social_name: 'Tiago', 
        birth_date: '26/11/1993', job: 'DJ', department: 'Soundtrack', user: user_2)

        login_as user

        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos',
                                  description: 'Jogo de aventura do SNES', price: 100, user: user_2)
        product_2 = Product.create!(product_name: 'Super Mario World', category: 'Jogos',
                                    description: 'Jogo de aventura do SNES', price: 100, user: user_2)
        
        visit root_path
        
        fill_in 'Busca por produtos', with: product.product_name
        click_on 'Buscar'

        expect(page).to have_content(product.product_name)
        expect(page).not_to have_content(product_2.product_name)
        expect(page).to have_content(product.category)
        expect(page).to have_content(product.description)
        expect(page).to have_content(product.price)
        expect(page).to have_content(product.user.email)
    end
end




