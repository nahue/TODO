module SpecTestHelper
  def login(user)
    visit root_path
    click_link 'Entrar'
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_button "Enviar"
  end
end
