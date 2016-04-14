class SedentaryWagon < Wagon
  validates :sedentary_places, presence: true

  def self.model_name
    Wagon.model_name
  end
end