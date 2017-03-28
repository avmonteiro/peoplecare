require 'rails_helper'

feature 'User create professional perfil' do
    scenario 'Successfully' do
        region = Region.create(name: 'zona sul')

        speciality = Speciality.create(name: 'fisioterapeuta')

        professional = Professional.new(name: 'José', speciality: speciality, document: '413.555.321.77',
                                        address: 'Rua numero dois', neighborhood: 'Santa Cecília',
                                        birthdate: '26/04/1992', genre: 'masculino', transport: 'carro',
                                        perimeter: '8 km', description: 'Possuo CRM número 233-4343-232, tenho 9 anos de experiencia na área',
                                        photo: 'perfil.jpg', phone: '97475-3232', email: 'jose@hotmail.com', password: 'bahtata', region: region)

        visit root_path

        click_on 'Sou profissional de saúde'

        click_on 'Ainda não possuo cadastro'

        fill_in 'Nome', with: professional.name
        fill_in 'Especialidade', with: professional.speciality
        fill_in 'CPF', with: professional.document
        fill_in 'Endereço de atendimento', with: professional.address
        fill_in 'Bairro', with: professional.neighborhood
        fill_in 'Região', with: professional.region
        fill_in 'Data de Nascimento', with: professional.birthdate
        fill_in 'Sexo', with: professional.genre
        fill_in 'Meio de locomoção', with: professional.transport
        fill_in 'Perímetro de atendimento', with: professional.perimeter
        fill_in 'Descrição', with: professional.description
        fill_in 'Foto', with: professional.photo
        fill_in 'Telefone', with: professional.phone
        fill_in 'Email', with: professional.email
        fill_in 'Senha', with: professional.password, id: 'professional_password'
        fill_in 'Confirmação de Senha', with: professional.password, id: 'professional_password_confirmation'

        click_on 'Cadastrar'

        expect(current_path).to eq(root_path)
        expect(page).to have_content("Olá #{professional.email}")
    end
    scenario 'Should fill all fields' do
        visit root_path

        click_on 'Sou profissional de saúde'

        click_on 'Ainda não possuo cadastro'

        click_on 'Cadastrar'

        expect(page).to have_content 'Não foi possível submeter os dados'
    end
end
