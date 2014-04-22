FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person-#{n}@example.com" }
    password "p4ssw0rd"

    factory :user_with_urls do
      short_url_count 3

      after(:create) do |user, ev|
        create_list(:short_url, ev.short_url_count, user: user)
      end
    end
  end

  factory :short_url do
    sequence(:url) { |n| "http://example-#{n}.com" }
    sequence(:short_code) { |n| "SHORT#{n}" }
    sequence(:secret_code) { |n| "SECRET#{n}" }
    user
  end
end
