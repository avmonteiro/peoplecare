require 'rails_helper'

feature 'Professional search for patients by medical treatment and region' do
  scenario 'Successfully' do
    region = Region.create(name: 'zona sul')

    speciality = Speciality.create(name: 'fisioterapeuta')

    professional = Professional.create(name: 'José', speciality: speciality, document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                    region: region, password: 'bahtata')

    patient = Patient.create(photo: 'fotojpeg', name: 'Renan Guirado',
                            address: 'rua x apto 3, numero 300', neighborhood: 'Ipiranga',
                            birthdate: '04/01/2001', genre: 'Masculino',
                            phone: '988759274', email: 'zezinho@email.com',
                            speciality: speciality,
                            document: '07583849-0', profession: 'advogado', password: '123456',
                            talk_to: 'Maria', phone_contact: '977639621', region: region)

    other_patient = Patient.create(photo: 'fotojpeg', name: 'Mariana',
                            address: 'faasdsadadd', neighborhood: 'Ipiranga',
                            birthdate: '04/01/2001', genre: 'Feminino',
                            phone: '988759274', email: 'mariana@email.com',
                            speciality: speciality,
                            document: '07583849-0', profession: 'desenvolvedora', password: '123456',
                            talk_to: 'Maria', phone_contact: '977639621', region: region)

    last_patient = Patient.create(photo: 'fotojpeg', name: 'Fabio',
                            address: 'rua 1234 098', neighborhood: 'Ipiranga',
                            birthdate: '04/01/2001', genre: 'masculino',
                            phone: '988759274', email: 'fabio@email.com',
                            speciality: speciality,
                            document: '07583849-0', profession: 'desenvolvedora', password: '123456',
                            talk_to: 'Maria', phone_contact: '977639621', region: region)
  visit root_path

  click_on 'Sou profissional de saúde'

  fill_in 'Email', with: professional.email
  fill_in 'Senha', with: professional.password

  click_on 'Entrar'

  click_on 'Pacientes Próximos'

  expect(page).to have_content patient.name
  expect(page).to have_content patient.address
  expect(page).to have_content patient.region.name
  expect(page).to have_content patient.email

  expect(page).to have_content other_patient.name
  expect(page).to have_content other_patient.address
  expect(page).to have_content other_patient.region.name
  expect(page).to have_content other_patient.email

  end
end
