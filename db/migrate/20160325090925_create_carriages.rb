class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.integer :number
      t.integer :top_places
      t.integer :bottom_places
      t.integer :side_top_places
      t.integer :side_bottom_places
      t.belongs_to :train
      t.string :type

      t.timestamps null: false
    end
  end
end
