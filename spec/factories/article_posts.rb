FactoryGirl.define do
  factory :article_post, class: 'Article::Post' do
    sequence(:headline) { |n| "Article #{n}" }
    subhead { headline }
    body { headline }
    is_featured false
    published_at DateTime.now
    author
    column { author.columns.first }

    trait :unpublished do
      published_at nil
    end

    trait :scheduled do
      published_at DateTime.now + 1.day
    end

    trait :featured do
      is_featured true
    end
  end
end
