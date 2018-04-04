class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.float :fixed_fee
      t.float :percent_fee
      t.float :amount_fee
      t.float :transfer_amount
      t.string :transaction_type
      t.references :user, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
