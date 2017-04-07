class Trip < ApplicationRecord
    belongs_to :driver
    belongs_to :rider

    validates :driver_id, presence: true, numericality: { only_integer: true }
    validates :rider_id, presence: true, numericality: { only_integer: true }
    validates :date, presence: true
    validates :cost, numericality: { only_float: true }
    validates :rating, numericality: { only_float: true }
end
