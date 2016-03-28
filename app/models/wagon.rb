class Wagon < ActiveRecord::Base
  belongs_to :train

  validates :type, inclusion: {in: :wagon_type_ids}
  validates :train, presence: true
  validates :number, presence: true, numericality: { only_integer: true },
            uniqueness: { scope: :train, message: "Неуникальный номер вагона" }

  before_validation :set_number

  #default_scope { order(:number => (train.sorting_wagons ? :desc : :asc )) }
  scope :sorting, -> (train) { order(:number => (train.sorting_wagons ? :desc : :asc )) }

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

  def set_number
    if train and self.number==nil
      number = train.wagons.maximum(:number) || 0
      self.number = number + 1
    end
  end

end
