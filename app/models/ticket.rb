class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :train, :start_station, :end_station, presence: true
end
