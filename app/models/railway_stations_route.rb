class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :station, class_name: 'RailwayStation', foreign_key: :railway_station_id
  belongs_to :route
end