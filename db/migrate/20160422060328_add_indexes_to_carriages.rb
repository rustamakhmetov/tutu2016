class AddIndexesToCarriages < ActiveRecord::Migration
  def change
    add_index :carriages, [:id, :type]
    add_index :carriages, :train_id
  end
end
