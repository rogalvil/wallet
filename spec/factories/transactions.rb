FactoryBot.define do
  factory :transaction do
    amount 0
    fixed_feem 0
    percent_fee 0
    amount_fee 0
    transfer_amount 0 
    transaction_type 'Deposit'
    account
    card
  end
end