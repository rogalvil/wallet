class AddSomeFieldsToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :card_number, :string
    add_column :cards, :name, :string
    add_column :cards, :card_type, :string
    add_column :cards, :expirate_date, :string
    add_column :cards, :cvv, :string
    rename_column :cards, :card_number_last, :last_digits
  end
end
