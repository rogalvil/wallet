FactoryBot.define do
  factory :account do
    account_number { Faker::Bank.iban }
    balance 0
    user
  end
end