require 'rails_helper'

feature 'Patient search for professionals by medical treatment and region' do
  scenario 'Successfully' do

    region = Region.create(name: 'zona sul')

    speciality = Speciality.create(name: 'fisioterapeuta')

    patient = Patient.create(photo: 'fotojpeg', name: 'Renan Guirado',
                            address: 'rua x apto 3, numero 300', neighborhood: 'Ipiranga',
                            birthdate: '04/01/2001', genre: 'Masculino',
                            phone: '988759274', email: 'zezinho@email.com', speciality: speciality,
                            document: '07583849-0', profession: 'advogado', password: '123456',
                            talk_to: 'Maria', phone_contact: '977639621', region: region)

    professional = Professional.create(name: 'José', speciality: speciality, document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                    region: region, password: 'bahtata')

    other_professional = Professional.create(name: 'Mário', speciality: speciality, document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'mario@hotmail.com',
                                    region: region, password: 'bahtata')

  visit root_path

  click_on 'Estou procurando um profissional'

  fill_in 'Email', with: patient.email
  fill_in 'Senha', with: patient.password

  click_on 'Entrar'

  click_on 'Profissionais Próximos'

  expect(page).to have_content professional.name
  expect(page).to have_content professional.address
  expect(page).to have_content professional.region.name
  expect(page).to have_content professional.email

  expect(page).to have_content other_professional.name
  expect(page).to have_content other_professional.address
  expect(page).to have_content other_professional.region.name
  expect(page).to have_content other_professional.email

  end
end
