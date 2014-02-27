require 'spec_helper'

feature "User Management", %q{
  As the site owner
  I want to provide an user management
  so that I can protect functions and grant access based on roles
} do

  background do
    @agent = create(:user,:agent)
  end

  scenario 'User signs up' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'user[name]', with: 'Nahuel Chaves'

    click_button 'Submit'
    expect(page).to have_content "Sign Up Complete"
  end
end
