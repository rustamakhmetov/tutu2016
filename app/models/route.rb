class Route < ActiveRecord::Base
  validates :name, presence: true

  has_many :railway_stations_routes
  has_many :stations, through: :railway_stations_routes
  has_many :trains
end