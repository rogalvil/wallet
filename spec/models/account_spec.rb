require 'rails_helper'

RSpec.describe Account, type: :model do
  # Association test
  it { should belong_to(:user) }
  # Validation tests
  it { should validate_presence_of(:balance) }
  it { should validate_presence_of(:account_number) }
end
