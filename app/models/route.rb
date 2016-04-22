class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  def delete_station(station)
    self.stations.delete(station)
    send :set_name
    self.save
  end

  private

  def set_name
    if self.stations.empty?
      self.name = "Без станций"
    elsif self.stations.nil?
      self.name = "#{self.stations.first.title} - #{self.stations.last.title}"
    end
  end

  def stations_count
    if stations.size < 2
      errors.add(:base, 'Маршрут должен содержать минимум 2 станции')
    end
  end
end