class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :siret
      t.string :bic
      t.string :iban
      t.text :footer

      t.timestamps
    end
  end
end
