class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :from_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :to_tickets, class_name: 'Ticket', foreign_key: :end_station_id

  validates :title, presence: true
end
