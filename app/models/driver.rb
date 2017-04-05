class Driver < ApplicationRecord
    has_many :trips
    validates :vin, uniqueness: true, length: { in: 11..17 }

    def driver_trips
        @driver_trips = Trip.where(driver_id: id)
    end

    def earnings
        driver_trips
        driver_earnings = @driver_trips.map(&:cost)
        @total_earnings = (driver_earnings.reduce(:+) * 0.85).round(2)
    end

    def rating
        driver_trips
        ratings = @driver_trips.map(&:rating)
        @avg_rating = (ratings.reduce(:+) / ratings.size).round(1)
    end
end
