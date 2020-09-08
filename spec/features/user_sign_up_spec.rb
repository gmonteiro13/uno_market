require 'rails_helper'

feature 'User sign up' do
        scenario 'from home page' do
        
        visit root_path

        expect(page).to have_link('Criar conta')
    end

    scenario 'successfully' do
        visit root_path
        click_on 'Criar conta'
        fill_in 'Email', with: 'biel@email.com'
        fill_in 'Senha', with: '87654321'
        fill_in 'Confirme sua senha', with: '87654321'
        click_on 'Criar'

        expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
        expect(page).to have_link 'Encerrar sessão'
        expect(page).not_to have_link 'Criar conta'
    end

    scenario 'and sign out' do
        user = User.create!(email: 'biel@email.com', password: '123456')

        login_as user

        visit root_path
        click_on 'Encerrar sessão'

        expect(page).to have_content('Logout efetuado com sucesso.')
        expect(page).to have_link('Iniciar sessão')
        expect(page).to have_link('Criar conta')
        expect(page).not_to have_link ('Encerrar sessão')
    end

    
end