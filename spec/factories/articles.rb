FactoryBot.define do
  factory :article do
    title { 'My title' }
    content { 'Content' }
    slug { 'my-title' }
  end
end
