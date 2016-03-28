class EconomyCarriage < Carriage
  validates :side_top_places, :side_bottom_places, presence: true
end