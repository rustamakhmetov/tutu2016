class ReservedSeatWagon < Wagon
  validates :bottom_places, :top_places, :side_bottom_places, :side_top_places,  presence: true

  # http://stackoverflow.com/questions/4507149/best-practices-to-handle-routes-for-sti-subclasses-in-rails
  def self.model_name
    Wagon.model_name
  end
end