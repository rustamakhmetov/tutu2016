class Train < ActiveRecord::Base
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :wagons
  has_many :carriages

  validates :number, presence: true

  # use: train.places_count("SleepingWagon", :bottom_places)
  def places_count(wagon_type, place_type)
    self.wagons.where(type: wagon_type).sum(place_type)
  end

  def sorted_wagons
    if self.sorting_wagons
      Wagon.sorting_desc
    else
      Wagon.sorting_asc
    end
  end

end
