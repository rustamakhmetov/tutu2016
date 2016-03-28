class AddNumberToWagons < ActiveRecord::Migration
  def change
    add_column :wagons, :number, :integer
    add_index :wagons, :number
  end
end
