require 'rails_helper'

RSpec.describe "user/accounts/show.html.slim", type: :view do
  let(:date) { DateTime.new 2016, 03, 20, 12, 00, 00 }
  let(:account) { FactoryGirl.build(:user_account, created_at: date) }

  it "displays the specified user" do
    assign(:account, account)

    render

    expect(rendered).to match %r{<h1>#{account.username}</h1>}
    expect(rendered).to include "Joined on <time datetime=\"#{date.iso8601}\" data-local=\"time\" data-format=\"%B %e, %Y\">#{date.strftime("%B %-d, %Y")}</time>"
  end
end
