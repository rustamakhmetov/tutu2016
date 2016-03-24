class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :wagon_type
      t.integer :top_places
      t.integer :bottom_places

      t.timestamps null: false
    end
  end
end
