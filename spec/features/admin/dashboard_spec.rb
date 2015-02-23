require 'rails_helper'

RSpec.feature "Admin dashboard", type: :feature do
  let(:admin) { FactoryGirl.create(:admin, confirmed_at: DateTime.now) }

  scenario "Admin visits the dashboard" do
    visit "/user/sign_in"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password

    click_button "Sign in"

    visit "/admin"

    expect(page).to have_text("thetallgrass.net Admin")
  end
end
