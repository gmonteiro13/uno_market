require 'rails_helper'

feature 'User view products' do
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
        click_on 'Comprar'
        click_on 'Iniciar compra'

        expect(current_path).to eq(product_path(product.id))
        expect(page).to have_content('Processo de compra iniciado')
        expect(product.deal).to be_open
        expect(product.reload).to be_unavailable
    end

    scenario 'must have a created profile' do
        user = User.create!(email: 'biel@nintendo.com', password: '123456')
        user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos', description: 'Jogo de aventura do SNES', price: 100, user: user_2, status: :available)
        
        login_as user
        visit root_path
        click_on 'Ver todos os produtos'
        click_on "Ver #{product.product_name}"
        click_on 'Comprar'

        expect(current_path).to eq(product_path(product.id))
        expect(page).to have_content('Você precisa criar um perfil para fazer uma compra')
    end

    scenario 'does not view unavailable products' do
        user = User.create!(email: 'biel@nintendo.com', password: '123456')
        user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos', description: 'Jogo de aventura do SNES', price: 100, user: user_2, status: :available)
        product_2 = Product.create!(product_name: 'Shinobi III', category: 'Jogos', description: 'Jogo com trilha sonora fantástica', price: 80, user: user_2, status: :available)
        profile = Profile.create!(full_name: 'Gabriel Soares Cardoso Monteiro', social_name: 'Gabriel Monteiro', 
        birth_date: '14/12/1994', job: 'Level Designer', department: 'Jogos', user: user)

        login_as user
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

    scenario 'and seller closes deal' do
        user = User.create!(email: 'biel@nintendo.com', password: '123456')
        user_2 = User.create!(email: 'tiago@nintendo.com', password: '654321')
        profile = Profile.create!(full_name: 'Gabriel Soares Cardoso Monteiro', social_name: 'Gabriel Monteiro', 
        birth_date: '14/12/1994', job: 'Level Designer', department: 'Jogos', user: user)
        profile_2 = Profile.create!(full_name: 'Tiago Pereira', social_name: 'Tiago', 
        birth_date: '26/11/1993', job: 'DJ', department: 'Soundtrack', user: user_2)
        product = Product.create!(product_name: 'Donkey Kong Country 2', category: 'Jogos', description: 'Jogo de aventura do SNES', price: 100, user: user_2, status: :available)
        deal = Deal.create!(product: product, user_id: user.id)

        login_as user_2
        visit root_path
        click_on 'Ver seu perfil'
        click_on 'Donkey Kong Country 2'
        click_on 'Ver detalhes da compra'
        select 'Confirmar', from: 'Status'
        click_on 'Finalizar'

        expect(product.reload).to be_available
    end
end