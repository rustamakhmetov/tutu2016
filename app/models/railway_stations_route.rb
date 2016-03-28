class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :station, class_name: 'RailwayStation', foreign_key: :railway_station_id
  belongs_to :route

  validates :railway_station_id, uniqueness: {scope: :route_id}
end