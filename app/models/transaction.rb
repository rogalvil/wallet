class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :card
  
  validates_presence_of :amount, :fixed_fee, :percent_fee, :amount_fee, :transfer_amount, :transaction_type
end
