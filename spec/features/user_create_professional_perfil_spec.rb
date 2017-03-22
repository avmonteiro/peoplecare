require 'rails_helper'

feature 'User create professional perfil' do
  scenario 'Successfully' do
    professional = Professional.new(name: 'José', speciality: 'nutricionista', document: '413.555.321.77',
                                    adress: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                    birthdate: '26/04/1992', sex: 'masculino', transport: 'carro',
                                    perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                    photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com')

    visit root_path

    click_on 'Sou profissional de saúde'

    fill_in 'Nome', with: professional.name
    fill_in 'Especialidade', with: professional.speciality
    fill_in 'CPF', with: professional.document
    fill_in 'Endereço de atendimento', with: professional.adress
    fill_in 'Bairro', with: professional.neighborhood
    fill_in 'Data de Nascimento', with: professional.birthdate
    fill_in 'Sexo', with: professional.sex
    fill_in 'Meio de locomoção', with: professional.transport
    fill_in 'Perímetro de atendimento', with: professional.perimeter
    fill_in 'Descrição', with: professional.description
    fill_in 'Foto', with: professional.photo
    fill_in 'Telefone', with: professional.phone
    fill_in 'Email', with: professional.email

    click_on 'Cadastrar'

    expect(page).to have_content professional.name
    expect(page).to have_content professional.speciality
    expect(page).to have_content professional.document
    expect(page).to have_content professional.birthdate
    expect(page).to have_content professional.sex
    expect(page).to have_content professional.transport
    expect(page).to have_content professional.description
    expect(page).to have_content professional.phone
    expect(page).to have_content professional.email

  end
  scenario 'Should fill all fields' do
    visit root_path

    click_on 'Sou profissional de saúde'

    click_on 'Cadastrar'

    expect(page).to have_content 'Não foi possível cadastrar o profissional'
  end
end
