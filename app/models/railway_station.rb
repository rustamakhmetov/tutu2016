class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :from_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :to_tickets, class_name: 'Ticket', foreign_key: :end_station_id

  validates :title, presence: true

  #scope :ordered, -> {joins(:railway_stations_routes).order('railway_stations_routes.position ASC')}
  scope :ordered, -> {order('railway_stations_routes.position')}

  def position(route)
    obj = railway_stations_routes_object(route)
    obj.position
  end

  def update_position(route, pos)
    obj = railway_stations_routes_object(route)
    obj.position = pos
    obj.save
  end

  private

  def railway_stations_routes_object(route)
    self.railway_stations_routes.where(route_id: route).first
  end

end
