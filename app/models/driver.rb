class Driver < ApplicationRecord
    has_many :trips

    def driver_trips
        @driver_trips = Trip.where(driver_id: id)
    end

    def earnings
        driver_trips
        earnings = @driver_trips.map(&:cost)
        @total_earnings = earnings.reduce(:+).round(2)
    end

    def rating
        driver_trips
        ratings = @driver_trips.map(&:rating)
        @avg_rating = (ratings.reduce(:+) / ratings.size).round(1)
    end
end
