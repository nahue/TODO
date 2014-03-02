require 'spec_helper'

feature "User Management", %q{
  As the site owner
  I want to provide an user management
  so that I can protect functions and grant access based on roles
} do

  background do
    @user = create(:user)
  end

  scenario 'User signs up' do

    create_user
    expect(page).to have_content "Gracias por registrarse"
  end

  scenario 'User logs in' do

    login @user


    expect(page).to have_content "Bienvenido!"
  end

  scenario 'User logs out' do

    login @user

    click_link "Salir"
    expect(page).to have_content "Ingresar al sistema"
  end


  def create_user
    visit root_path
    click_link 'Crear una cuenta'
    fill_in 'user[email]', with: "pepe@pepe.com"
    fill_in 'user[firstname]', with: "pepe"
    fill_in 'user[lastname]', with: "carioca"
    fill_in 'user[password]', with: "secret"
    fill_in 'user[password_confirmation]', with: "secret"

    click_button 'Enviar'
  end


end
