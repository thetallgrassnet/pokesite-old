FactoryGirl.define do
  sequence(:username) { |n| "user#{n}" }

  factory :user_account, class: 'User::Account' do
    username
    email { "#{username}@domain.com" }
    password "P@55w0rd"
    password_confirmation "P@55w0rd"

    trait :confirmed do
      confirmed_at { Time.now }
    end

    trait :is_admin do
      is_admin true
    end

    factory :author do
      after(:create) do |user, evaluator|
        create_list(:article_column, 1, writers: [user])
      end
    end
  end
end
