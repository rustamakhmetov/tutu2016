class Wagon < ActiveRecord::Base
  belongs_to :train

  validates :wagon_type, :bottom_places, :top_places, presence: true
end
