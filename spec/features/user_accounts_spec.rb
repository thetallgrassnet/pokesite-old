require 'rails_helper'

RSpec.feature "User accounts", type: :feature do
  let(:user) { FactoryGirl.create(:user_account, :confirmed)}

  scenario "User creates a new account" do
    visit "/user/sign_up"

    expect(page).to have_selector("body.user.registrations")

    new_user = FactoryGirl.build :user_account

    fill_in "Username", with: new_user.username
    fill_in "Email", with: new_user.email
    fill_in "Password", with: new_user.password
    fill_in "Password confirmation", with: new_user.password

    click_button "Sign up"

    expect(page).to have_selector("#flash .alert.alert-info")
    expect(page).to have_text("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end

  scenario "User signs in" do
    visit "/user/sign_in"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"

    expect(page).to have_text("Signed in successfully.")
    expect(page).to have_text(user.username)
  end
end
