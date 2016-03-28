class CompartmentWagon < Wagon
  validates :bottom_places, :top_places, presence: true

  def self.model_name
    Wagon.model_name
  end
end