class Wagon < ActiveRecord::Base
  belongs_to :train

  validates :type, inclusion: {in: :wagon_type_ids}
  validates :train, presence: true

  WAGON_TYPES = { 'SleepingWagon'=>'СВ', 'CompartmentWagon' => 'Купейный', 'ReservedSeatWagon' => 'Плацкартный', 'SedentaryWagon' => 'Сидячий'}

  def wagon_type_ids
    WAGON_TYPES.keys
  end

  def wagon_type_title
    WAGON_TYPES[self.type]
  end

  def to_partial_path
    'wagon'
  end

end
