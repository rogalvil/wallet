class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.float :balance
      t.string :account_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
