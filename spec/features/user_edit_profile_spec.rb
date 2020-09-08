require 'rails_helper'

feature 'User create profile' do
    scenario 'successfully' do
        user = User.create!(email: 'biel@email.com', password: '123456')

        login_as user

        visit root_path
        click_on 'Criar perfil'

        fill_in 'Nome completo', with: 'Gabriel Soares Cardoso Monteiro'
        fill_in 'Nome social', with: 'Gabriel Monteiro'
        select '16', from: 'profile_birth_date_3i'
        select 'dezembro', from: 'profile_birth_date_2i'
        select '1987', from: 'profile_birth_date_1i'
        fill_in 'Cargo', with: 'Level Designer'
        fill_in 'Setor', with: 'Jogos'

        click_on 'Criar Perfil'
        click_on 'Editar'
        fill_in 'Setor', with: 'Design'
        click_on 'Atualizar Perfil'

        expect(page).to have_content('Gabriel Soares Cardoso Monteiro')
        expect(page).to have_content('Gabriel Monteiro')
        expect(page).to have_content('16-12-1987')
        expect(page).to have_content('Level Designer')
        expect(page).to have_content('Design')
        expect(page).not_to have_content('Jogos')

        

    end
end