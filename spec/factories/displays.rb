FactoryBot.define do
  factory :display do
    name { 'Front Counter Display' }
    displayable { nil }
    user
  end
end
