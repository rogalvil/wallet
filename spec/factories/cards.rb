FactoryBot.define do

  factory :card do
    #card_number { Faker::Stripe.valid_card }
    #name { Faker::HarryPotter.character }
    #card_type 'credit'
    #expiration { Faker::Date.between(Date.tomorrow, Date.tomorrow + (rand(1..60).months)) }
    #cvv { Faker::Stripe.ccv }
    card_number_last { Faker::Stripe.valid_card.last(4) }   
    user   
  end
end