class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :reference
      t.string :description
      t.integer :number
      t.string :tva
      t.integer :total_ht, default: 0
      t.integer :total_ttc, default: 0
      t.integer :total_tva, default: 0

      t.timestamps
    end
  end
end
