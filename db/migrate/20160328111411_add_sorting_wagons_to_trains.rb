class AddSortingWagonsToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :sorting_wagons, :boolean, :default => false
  end
end
