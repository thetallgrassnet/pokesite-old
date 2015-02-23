require 'rails_helper'

RSpec.feature "User accounts", type: :feature do
  scenario "User creates a new account" do
    visit "/user/sign_up"

    expect(page).to have_selector("body.user.registrations")

    user = FactoryGirl.build :user_account

    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password

    click_button "Sign up"

    expect(page).to have_selector("#flash .alert.alert-info")
    expect(page).to have_text("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end
end
