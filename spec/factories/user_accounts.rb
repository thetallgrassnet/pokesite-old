FactoryGirl.define do
  factory :user_account, class: 'User::Account' do
    sequence(:username) { |n| "user#{n}" }
    email { "#{username}@domain.com" }
    password "P@55w0rd"
    password_confirmation "P@55w0rd"
  end

end
