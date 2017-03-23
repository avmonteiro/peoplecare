require 'rails_helper'

feature 'User sign in' do
  scenario 'Successfully' do
    professional = Professional.create(name: 'José', speciality: 'nutricionista', document: '413.555.321.77',
                                    adress: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', sex: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                    region: 'zona norte', password: 'bahtata')

  visit root_path

  click_on 'Sou profissional de saúde'

  fill_in 'Email', with: professional.email
  fill_in 'Senha', with: professional.password

  click_on 'Entrar'

  expect(current_path).to eq(root_path)
  expect(page).to have_content("Olá #{professional.email}")

  end
end
