require 'rails_helper'

RSpec.describe "Login", type: :feature do
  let(:user) do
    User.create({
      name:  'username',
      email: 'username@example.com',
      password: 'password',
      password_confirmation: 'password',
    })
  end

  before :each do
    visit '/' #
  end

  scenario "A user can access the login page." do
    click_link 'Login'

    within("header") do
      expect(page).to have_no_css 'a', text: 'Login'
      expect(page).to have_no_css 'a', text: 'Logout'
      expect(page).to have_css 'a', text: 'Sign up'
    end
    within(".contents") do
      expect(page).to have_css 'h2', text: 'Login'
      expect(page).to have_selector "form#new_user"
    end
    within("form#new_user") do
      expect(page).to have_selector "input[type='text']"
      expect(page).to have_selector "input[type='password']"
      expect(page).to have_selector "input[type='checkbox']"
      expect(page).to have_selector "input[type='submit']"
    end
  end

  scenario "A user can login Terakoya." do
    click_link 'Login'

    within("form#new_user") do
      fill_in 'Name or E-mail', with: user.email
      fill_in t('password'),    with: user.password
      click_button 'Login'
    end

    within("header") do
      expect(page).to have_content user.name
      expect(page).to have_no_css 'a', text: 'Login'
      expect(page).to have_css 'a', text: 'Logout'
      expect(page).to have_no_css 'a', text: 'Sign up'
    end
    within(".contents") do
      expect(page).to have_css 'h1', text: 'Terakoya'
    end
  end

  scenario "Login user can logout Terakoya." do
    click_link 'Login'

    within("form#new_user") do
      fill_in 'Name or E-mail', with: user.email
      fill_in t('password'),    with: user.password
      click_button 'Login'
    end

    within("header") do
      click_link 'Logout'
    end

    within("header") do
      expect(page).to have_no_content user.name
      expect(page).to have_css 'a', text: 'Login'
      expect(page).to have_no_css 'a', text: 'Logout'
      expect(page).to have_css 'a', text: 'Sign up'
    end
  end
end