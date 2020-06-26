FactoryBot.define do
  factory :comment do
    content { "MyString" }
    association :article
  end
end
