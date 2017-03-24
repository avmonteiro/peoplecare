require 'rails_helper'

feature 'Professional search for patients by region' do
  scenario 'Successfully' do
    professional = Professional.create(name: 'José', speciality: 'nutricionista', document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                    region: 'zona norte', password: 'bahtata')

    patient = Patient.create(photo: 'fotojpeg', name: 'Renan Guirado',
                          address: 'rua x apto 3, numero 300', neighborhood: 'Ipiranga',
                            birthdate: '04/01/2001', genre: 'Masculino',
                            phone: '988759274', email: 'zezinho@email.com',
                            looking_for: 'fisioterapeuta especializado em choques faciais',
                            document: '07583849-0', profession: 'advogado',
                            talk_to: 'Maria', phone_contact: '977639621', region: 'zona norte')

    otherPatient = Patient.create(photo: 'fotojpeg', name: 'Mariana',
                          address: 'rua x apto 3, numero 300', neighborhood: 'Ipiranga',
                            birthdate: '04/01/2001', genre: 'Feminino',
                            phone: '988759274', email: 'zezinho@email.com',
                            looking_for: 'fisioterapeuta especializado em choques faciais',
                            document: '07583849-0', profession: 'desenvolvedora',
                            talk_to: 'Maria', phone_contact: '977639621', region: 'zona sul')
  visit root_path

  click_on 'Sou profissional de saúde'

  fill_in 'Email', with: professional.email
  fill_in 'Senha', with: professional.password

  click_on 'Entrar'

  expect(current_path).to eq(root_path)
  expect(page).to have_content("Olá #{professional.email}")

  click_on 'Pacientes Próximos'

  expect(page).to have_content patient.name
  expect(page).to have_content patient.address
  expect(page).to have_content patient.region
  expect(page).to have_content patient.email

  expect(page).not_to have_content otherPatient.name
  expect(page).not_to have_content otherPatient.address
  expect(page).not_to have_content otherPatient.region
  expect(page).not_to have_content otherPatient.email

  end
end
