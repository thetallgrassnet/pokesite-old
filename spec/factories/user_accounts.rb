FactoryGirl.define do
  factory :user_account, class: 'User::Account' do
    sequence(:username) { |n| "user#{n}" }
    email { "#{username}@domain.com" }
    password "P@55w0rd"
    password_confirmation "P@55w0rd"

    trait :confirmed do
      confirmed_at { Time.now }
    end

    trait :is_admin do
      is_admin true
    end
  end
end
