FactoryGirl.define do
  factory :url, class: Url do
    original 'http://example.com'
    url_safe 'a1B2c'
  end
end
