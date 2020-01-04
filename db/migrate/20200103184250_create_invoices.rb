class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :reference
      t.string :description
      t.integer :number

      t.timestamps
    end
  end
end
