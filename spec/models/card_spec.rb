require 'rails_helper'

RSpec.describe Card, type: :model do

  # Association test
  it { should have_many(:transactions) }
  it { should belong_to(:user) } 
  
  # Validation tests
  #it { should validate_presence_of(:card_number) }
  #it { should validate_presence_of(:name) }
  #it { should validate_presence_of(:card_type) }
  #it { should validate_presence_of(:expiration) }
  #it { should validate_presence_of(:cvv) }
  it { should validate_presence_of(:card_number_last) }
 
end
