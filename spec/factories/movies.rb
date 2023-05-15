FactoryBot.define do
  factory :movie do
    youtube_id { "MyString" }
    youtube_url { "MyString" }
    title { "MyString" }
    description { "MyText" }
    user { nil }
  end
end
