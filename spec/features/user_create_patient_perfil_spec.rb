require 'rails_helper'

feature 'user create perfil' do
  scenario 'successfully' do
#setup
    patient = Patient.new(
        photo: "fotojpeg",
        name: "Renan Guirado",
        address: "rua x apto 3, numero 300",
        neighborhood: "Ipiranga",
        birthdate: "04/01/2001",
        genre: "Masculino",
        phone: "988759274",
        email: "zezinho@email.com",
        looking_for: "fisioterapeuta especializado em choques faciais",
        document: "07583849-0",
        profession: "fisioterapeuta",
        talk_to: "Maria",
        phone_contact: "977639621"
        )
        visit new_patient_path
#execucao
    fill_in "Nome Completo",          with: patient.name
    fill_in "Foto",                   with: patient.photo
    fill_in "Endereco",               with: patient.address
    fill_in "Bairro",                 with: patient.neighborhood
    fill_in "Data de Nascimento",     with: patient.birthdate
    fill_in "Sexo",                   with: patient.genre
    fill_in "Telefone",               with: patient.phone
    fill_in "E-mail",                 with: patient.email
    fill_in "O que procuro?",         with: patient.looking_for
    fill_in "Documento",              with: patient.document
    fill_in "Profissao",              with: patient.profession
    fill_in "Falar com",              with: patient.talk_to
    fill_in "Telefone do Contato",    with: patient.phone_contact

    click_on 'Cadastrar Paciente'
#expect
    expect(page).to have_content patient.name
    expect(page).to have_content patient.photo
    expect(page).to have_content patient.address
    expect(page).to have_content patient.neighborhood
    expect(page).to have_content patient.birthdate
    expect(page).to have_content patient.genre
    expect(page).to have_content patient.phone
    expect(page).to have_content patient.email
    expect(page).to have_content patient.looking_for
    expect(page).to have_content patient.document
    expect(page).to have_content patient.profession
    expect(page).to have_content patient.talk_to
    expect(page).to have_content patient.phone_contact
  end
end
