require 'rails_helper'

RSpec.describe "admin/user/accounts/index.html.slim", type: :view do
  let(:accounts) { FactoryGirl.create_list(:user_account, 5) }
  it "renders the template" do
    assign(:user_accounts, Kaminari.paginate_array(accounts).page(1))

    allow(view).to receive(:can?).with(:destroy, kind_of(User::Account)) { true }
    render
  end
end
