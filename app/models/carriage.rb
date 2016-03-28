class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :number, :top_places, :bottom_places, presence: true

  default_scope { order(:number) }

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
end
