class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :from_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :to_tickets, class_name: 'Ticket', foreign_key: :end_station_id

  validates :title, presence: true

  scope :ordered, -> {joins(:railway_stations_routes).order('railway_stations_routes.position').uniq}
  scope :ordered2, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }
  scope :ordered3, -> {order('railway_stations_routes.position')}

  def position(route)
    station_route(route).try(:position)
  end

  def update_position(route, pos)
    obj = station_route(route)
    obj.update(position: pos) if obj
  end

  private

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route_id: route).first
  end

end
