require 'rails_helper'

feature 'User register a valid product' do
    scenario 'must have a created profile' do
        user = User.create!(email: 'biel@email.com', password: '123456')
        login_as user
        visit root_path
        click_on 'Ver todos os produtos'
        click_on 'Novo produto'

        expect(current_path).to eq(products_path)
        expect(page).to have_content('Você precisa ter um perfil para registrar um novo produto')
        expect(page).to have_link('Criar perfil')
    end

    scenario 'and attributes cannot be blank' do
        user = User.create!(email: 'biel@email.com', password: '123456')
        profile = Profile.create!(full_name: 'Gabriel Soares Cardoso Monteiro', social_name: 'Gabriel Monteiro', 
        birth_date: '14/12/1994', job: 'Level Designer', department: 'Jogos', user: user)

        login_as user
        visit root_path
        click_on 'Ver todos os produtos'
        click_on 'Novo produto'

        fill_in 'Nome do produto', with: ''
        select 'Jogos', from: 'Categoria'
        fill_in 'Descrição', with: ''
        fill_in 'Preço', with: ''
        click_on 'Criar Produto'

        expect(page).to have_content('não pode ficar em branco', count: 3)
    end
end