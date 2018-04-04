require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # Association test
  #it { should belong_to(:account) }
  #it { should belong_to(:card) }
  # Validation tests
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:fixed_fee) }
  it { should validate_presence_of(:percent_fee) }
  it { should validate_presence_of(:amount_fee) }
  it { should validate_presence_of(:transfer_amount) }
  it { should validate_presence_of(:transaction_type) }

end
