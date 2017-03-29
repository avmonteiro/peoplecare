require 'rails_helper'

feature 'User search professional by speciality' do
  scenario 'Successfully' do
    region = Region.create!(name: 'zona sul')

    speciality = Speciality.create!(name: 'fisioterapeuta')

    professional = Professional.create!(name: 'José', speciality: speciality, document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                    region: region, password: 'bahtata')

    visit root_path

    fill_in 'search', with: professional.speciality.name

    click_on 'Buscar'

    expect(page).to have_content professional.name
    expect(page).to have_content professional.speciality.name
    expect(page).to have_content professional.transport
    expect(page).to have_content professional.region.name

  end
end
