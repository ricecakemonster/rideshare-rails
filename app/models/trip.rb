class Trip < ApplicationRecord
    belongs_to :driver
    belongs_to :rider
    validates :rating, :numericality => { :greater_than => 0, :less_than => 6, :allow_nil => true}

end
