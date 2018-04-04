class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates_presence_of :account_number, :balance
end
