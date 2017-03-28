require 'rails_helper'

feature 'User search professional by region' do
  scenario 'Successfully' do
    patient = Patient.create(photo: 'fotojpeg', name: 'Renan Guirado', address: 'rua x apto 3, numero: 300',
                                    neighborhood: 'Ipiranga', birthdate: '04/01/2001', genre: 'Masculino',
                                    email: 'edson@peoplecare.com', password: 'xpt000000o', phone: '988759274',
                                    looking_for: 'nutricionista',
                                    document: '07583849-0', profession: 'fisioterapeuta',
                                    talk_to: 'Maria', phone_contact: '977639621', region: 'zona norte')

    professional = Professional.create(name: 'José', speciality: 'nutricionista', document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                    region: 'zona norte', password: 'bahtata')

    other_professional = Professional.create(name: 'Maria', speciality: 'nutricionista', document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'asdad@hotmail.com',
                                    region: 'zona norte', password: 'bahtata')

    last_professional = Professional.create(name: 'dadsda', speciality: 'fisioterapeuta', document: '413.555.321.77',
                                    address: 'dfdsfsdfsfd', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'utuy@hotmail.com',
                                    region: 'zona norte', password: 'bahtata')
                                    visit root_path

    click_on 'Estou procurando um profissional'

    fill_in 'Email', with: patient.email
    fill_in 'Senha', with: patient.password

    click_on 'Entrar'

    fill_in 'search', with: patient.region

    click_on 'Buscar'

    expect(page).to have_content professional.name
    expect(page).to have_content professional.address
    expect(page).to have_content professional.email
    expect(page).to have_content professional.region
    expect(page).to have_content professional.speciality

    expect(page).to have_content other_professional.name
    expect(page).to have_content other_professional.address
    expect(page).to have_content other_professional.email
    expect(page).to have_content other_professional.region
    expect(page).to have_content other_professional.speciality

    expect(page).not_to have_content last_professional.name
    expect(page).not_to have_content last_professional.address
    expect(page).not_to have_content last_professional.email
    expect(page).not_to have_content last_professional.region
    expect(page).not_to have_content last_professional.speciality

  end
end
