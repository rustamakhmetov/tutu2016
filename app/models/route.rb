class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true
end