class Driver < ApplicationRecord
    has_many :trips
    validates :vin, uniqueness: true, length: { in: 11..17 }
    validates :name, format: { with: /\A[a-zA-Z\s]+\z/, message: 'only allows letters.' }

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
        ratings = @driver_trips.map(&:rating).compact
        @avg_rating = (ratings.reduce(:+) / ratings.size).round(1)
    end
end
