require 'rails_helper'

feature 'user visit home' do
  scenario 'successfully' do

    visit root_path

    expect(page).to have_content 'Bem Vindo ao PeopleCare!'

  end
end
