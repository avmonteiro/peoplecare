require 'rails_helper'

feature 'Professional logout from social recipes' do
  scenario 'Successfully' do
    region = Region.create(name: 'zona sul')

    speciality = Speciality.create(name: 'fisioterapeuta')
    
    professional = Professional.create(name: 'José', speciality: speciality, document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                    region: region, password: 'bahtata')

  visit root_path

  click_on 'Sou profissional de saúde'

  fill_in 'Email', with: professional.email
  fill_in 'Senha', with: professional.password

  click_on 'Entrar'

  expect(current_path).to eq(root_path)
  expect(page).to have_content("Olá #{professional.email}")

  click_on 'Logout'

  expect(page).not_to have_content("Olá #{professional.email}")

  end
end
