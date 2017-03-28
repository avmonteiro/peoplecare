require 'rails_helper'

feature 'Patient sign in' do
  scenario 'successfully' do
    region = Region.create(name: 'zona sul')

    speciality = Speciality.create(name: 'fisioterapeuta')

    patient = Patient.create(name: 'Renan', photo: 'img.jpeg',
                            genre: 'masculino', birthdate: '27/01/1980', address: 'rua x, numero 01',
                            phone: '967045135', speciality: speciality, talk_to: 'Roberto',
                            phone_contact: '980015647', email: 'paciente@teste.com', password: 'bahtata', region: region)

  visit root_path

  click_on 'Estou procurando um profissional'

  fill_in 'Email', with: patient.email
  fill_in 'Senha', with: patient.password

  click_on 'Entrar'

  expect(current_path).to eq(root_path)
  expect(page).to have_content("Olá #{patient.email}")
  end
end
