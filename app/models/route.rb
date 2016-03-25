class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true

  before_create :set_name

  private

  def set_name
    self.name = "#{self.stations.first.title} - #{self.stations.last.title}"
  end
end