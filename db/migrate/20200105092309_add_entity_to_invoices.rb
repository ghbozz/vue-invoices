class AddEntityToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :entity, index: true
  end
end
