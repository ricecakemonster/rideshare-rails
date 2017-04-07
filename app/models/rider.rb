class Rider < ApplicationRecord
    has_many :trips
    validates :name, format: { with: /\A[a-zA-Z .]+\z/,
    message: "only allows letters." }
    validates :phone_num, length: { minimum: 7,
    message: "Phone number should be longer than 7 digits" }


    def total_cost
        @trips = Trip.where(rider_id: id)
        @total = 0
            @trips.each do |trip|
                @total += trip.cost
            end
        return @total
    end
end
