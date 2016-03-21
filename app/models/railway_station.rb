class RailwayStation < ActiveRecord::Base
  validates :title, presence: true
  has_many :trains, foreign_key: :current_station_id
  #has_and_belongs_to_many :routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :from_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :to_tickets, class_name: 'Ticket', foreign_key: :end_station_id
end
