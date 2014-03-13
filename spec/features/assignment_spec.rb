require 'spec_helper'

feature 'El usuario administra turnos' do

  background do
    @user = create(:user)
  end

  scenario 'El usuario revisa los turnos' do
    login @user

    visit root_path
    click_link "Turnos"

    find('.page-title h3').should have_content('Turnos')
  end

  scenario 'El usuario crea un turno' do
    login @user

    visit root_path
    click_link "Turnos"
    click_link "Nuevo Turno"
  end
end
