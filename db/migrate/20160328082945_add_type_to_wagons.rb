class AddTypeToWagons < ActiveRecord::Migration
  def change
    add_column :wagons, :type, :string
    add_index :wagons, :type
  end
end
