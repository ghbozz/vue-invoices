class CreateFields < ActiveRecord::Migration[6.0]
  def change
    create_table :fields do |t|
      t.string :reference
      t.string :quantity
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
