require 'rails_helper'

feature "User view professional profile" do
  scenario 'successfully' do
    region = Region.create(name: 'zona sul')

    speciality = Speciality.create(name: 'fisioterapeuta')

    professional = Professional.create(name: 'José', speciality: speciality, document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                    region: region, password: 'bahtata')
    visit root_path

    fill_in 'search', with: 'fisioterapeuta'

    click_on 'Buscar'

    expect(page).to have_content professional.name
    expect(page).to have_content professional.speciality.name
    expect(page).to have_content professional.transport
    expect(page).to have_content professional.region.name

  end

  scenario 'User view details professional profile' do
    region = Region.create(name: 'zona sul')

    speciality = Speciality.create(name: 'fisioterapeuta')

    professional = Professional.create(name: 'José', speciality: speciality, document: '413.555.321.77',
                                    address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com',
                                    region: region, password: 'bahtata')
    visit root_path

    fill_in 'search', with: 'fisioterapeuta'

    click_on 'Buscar'

    click_on professional.name

    expect(page).to have_content professional.name
    expect(page).to have_content professional.speciality.name
    expect(page).to have_content professional.address
    expect(page).to have_content professional.neighborhood
    expect(page).to have_content professional.birthdate
    expect(page).to have_content professional.genre
    expect(page).to have_content professional.transport
    expect(page).to have_content professional.perimeter
    expect(page).to have_content professional.description
    expect(page).to have_content professional.phone
    expect(page).to have_content professional.email
    expect(page).to have_content professional.region.name

  end


end
