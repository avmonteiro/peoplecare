require 'rails_helper'

feature 'user create perfil' do
    scenario 'successfully' do
        # setup
        region = Region.create(name: 'zona sul')

        speciality = Speciality.create(name: 'fisioterapeuta')

        patient = Patient.new(photo: 'fotojpeg', name: 'Renan Guirado',
                              address: 'rua x apto 3, numero: 300', neighborhood: 'Ipiranga',
                              birthdate: '04/01/2001', genre: 'Masculino',
                              email: 'edson@peoplecare.com', password: 'xpt000000o', phone: '988759274',
                              speciality: speciality,
                              document: '07583849-0', profession: 'fisioterapeuta',
                              talk_to: 'Maria', phone_contact: '977639621', region: region)

        # visit new_patient_registration_path
        visit root_path
        click_on 'Estou procurando um profissional'
        click_on 'Ainda não possuo cadastro'

        # execucao
        fill_in 'Nome Completo',          with: patient.name
        fill_in 'Foto',                   with: patient.photo
        fill_in 'Endereco',               with: patient.address
        fill_in 'Bairro',                 with: patient.neighborhood
        fill_in 'Região',                 with: patient.region
        fill_in 'Data de Nascimento',     with: patient.birthdate
        fill_in 'Sexo',                   with: patient.genre
        fill_in 'Email',                  with: patient.email
        fill_in 'Senha',                  with: patient.password, id: 'patient_password'
        fill_in 'Confirmação de Senha',   with: patient.password, id: 'patient_password_confirmation'
        fill_in 'patient_phone',          with: patient.phone
        select speciality.name, from: 'Especialidade'
        fill_in 'O que procuro?',         with: patient.speciality
        fill_in 'Documento',              with: patient.document
        fill_in 'Profissão',              with: patient.profession
        fill_in 'Falar com',              with: patient.talk_to
        fill_in 'Telefone do Contato',    with: patient.phone_contact

        click_on 'Cadastrar Paciente'
        # expect
    end
    scenario 'Should fill all fields' do
        visit root_path

        click_on 'Estou procurando um profissional'

        click_on 'Ainda não possuo cadastro'

        click_on 'Cadastrar Paciente'

        expect(page).to have_content 'Não foi possível submeter os dados'
    end
end
