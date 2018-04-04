class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :card_number_last
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
