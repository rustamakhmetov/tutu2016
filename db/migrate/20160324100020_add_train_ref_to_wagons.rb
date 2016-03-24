class AddTrainRefToWagons < ActiveRecord::Migration
  def change
    add_belongs_to :wagons, :train
  end
end
