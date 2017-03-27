require 'rails_helper'

feature 'user create perfil' do
  scenario 'successfully' do
#setup
    patient = Patient.new(photo: 'fotojpeg', name: 'Renan Guirado',
                          address: 'rua x apto 3, numero: 300', neighborhood: 'Ipiranga',
                            birthdate: '04/01/2001', genre: 'Masculino',
                            email: 'edson@peoplecare.com', password: 'xpt000000o', phone: '988759274',
                            looking_for: 'fisioterapeuta especializado em choques faciais',
                            document: '07583849-0', profession: 'fisioterapeuta',
                            talk_to: 'Maria', phone_contact: '977639621')

    visit new_patient_registration_path
#execucao
    fill_in "Nome Completo",          with: patient.name
    fill_in "Foto",                   with: patient.photo
    fill_in "Endereco",               with: patient.address
    fill_in "Bairro",                 with: patient.neighborhood
    fill_in "Data de Nascimento",     with: patient.birthdate
    fill_in "Sexo",                   with: patient.genre
    fill_in "Email",                  with: patient.email
    fill_in "Senha",                  with: patient.password, id: 'patient_password'
    fill_in "Confirmação de Senha",   with: patient.password, id: 'patient_password_confirmation'
    fill_in "patient_phone",          with: patient.phone
    fill_in "O que procuro?",         with: patient.looking_for
    fill_in "Documento",              with: patient.document
    fill_in "Profissao",              with: patient.profession
    fill_in "Falar com",              with: patient.talk_to
    fill_in "Telefone do Contato",    with: patient.phone_contact

    click_on 'Cadastrar Paciente'
#expect
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Olá #{patient.email}")

  end



end
