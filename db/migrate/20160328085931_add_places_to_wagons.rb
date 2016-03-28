class AddPlacesToWagons < ActiveRecord::Migration
  def change
    add_column :wagons, :sedentary_places, :integer
    add_column :wagons, :side_bottom_places, :integer
    add_column :wagons, :side_top_places, :integer
  end
end
