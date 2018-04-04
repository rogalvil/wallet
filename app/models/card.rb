class Card < ApplicationRecord
  belongs_to :user
  has_many :transactions
  before_save :data_prepare
  before_validation :data_decrypt
  CARD_TYPES = %w(credit debit)

  validates_presence_of :card_number, :name, :card_type, :expirate_date, :cvv
  validates :card_type, inclusion: { in: CARD_TYPES }
  validates :card_number, numericality: true, length: { is: 16 }
  validates :expirate_date, length: { is: 5 }
  validates :cvv, length: { is: 3 }

  private 
    def data_prepare
      self.last_digits = self.card_number.last(4)
      self.card_number = Cipher::AES.encrypt(self.card_number)
      self.name = Cipher::AES.encrypt(self.name)
      self.expirate_date = Cipher::AES.encrypt(self.expirate_date)
      self.cvv = Cipher::AES.encrypt(self.cvv)
    end

    def data_decrypt
      puts persisted?
      puts self.attribute_present?(:card_number)
      puts self.attribute_present?(:name)
      puts self.attribute_present?(:cvv)
      puts self.attribute_present?(:expirate_date)
      if persisted?
        self.card_number = Cipher::AES.decrypt(self.card_number) if self.attribute_present?(:card_number)
        self.name = Cipher::AES.decrypt(self.name) if self.attribute_present?(:name)
        self.cvv = Cipher::AES.decrypt(self.cvv)  if self.attribute_present?(:cvv)
        self.expirate_date = Cipher::AES.decrypt(self.expirate_date)  if self.attribute_present?(:expirate_date)
      end
    end

end
