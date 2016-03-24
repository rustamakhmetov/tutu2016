class Wagon < ActiveRecord::Base
  belongs_to :train

  validates :wagon_type, inclusion: {in: :wagon_type_ids}
  validates :train, :bottom_places, :top_places, presence: true

  WAGON_TYPES = { 'Compartment' => 'Купейный', 'ReservedSeat' => 'Плацкартный'}

  def wagon_type_ids
    WAGON_TYPES.keys
  end

  def wagon_type_title
    WAGON_TYPES[self.wagon_type]
  end

end
