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
end