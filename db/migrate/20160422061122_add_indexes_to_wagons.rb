class AddIndexesToWagons < ActiveRecord::Migration
  def change
    add_index :wagons, :train_id
  end
end
