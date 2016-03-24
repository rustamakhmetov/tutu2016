class Train < ActiveRecord::Base
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :wagons

  validates :number, presence: true
end
