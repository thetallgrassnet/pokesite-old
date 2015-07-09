require 'rails_helper'

RSpec.describe "admin/user/accounts/index.html.slim", type: :view do
  it "renders the template" do
    assign(:user_accounts, 5.times.collect { FactoryGirl.create(:user_account, confirmed_at: DateTime.now) })

    allow(view).to receive(:can?).with(:destroy, kind_of(User::Account)) { true }
    render
  end
end
