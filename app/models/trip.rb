class Trip < ApplicationRecord
    belongs_to :driver
    belongs_to :rider

    validates :driver_id, presence: true, numericality: { only_integer: true }
    validates :rider_id, presence: true, numericality: { only_integer: true }
    validates :date, presence: true
    validates :cost, numericality: { only_float: true }
    validates :rating, numericality: { only_float: true, greater_than: 0, less_than: 6, allow_nil: true, message: "Rating should be between 1 and 5" }
end
