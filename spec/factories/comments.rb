FactoryBot.define do
  factory :comment do
    content { "MyString" }
    association :article
    association :user
  end
end
