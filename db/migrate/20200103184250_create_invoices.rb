class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :reference
      t.string :description
      t.integer :total
      t.integer :number
      t.string :tva
      t.integer :total_ht
      t.integer :total_ttc
      t.integer :total_tva

      t.timestamps
    end
  end
end
