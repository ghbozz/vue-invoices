class AddUserReferenceToEntity < ActiveRecord::Migration[6.0]
  def change
    add_reference :entities, :user, index: true
  end
end
