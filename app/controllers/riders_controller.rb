class RidersController < ApplicationController
    def index
        @riders = Rider.all
    end

    def show
        @rider = Rider.find(params[:id])
        session[:prev_url] = request.referer
    end

    def new
        @rider = Rider.new
    end

    def create
        @rider = Rider.new(rider_params)
        if @rider.save
            redirect_to riders_path
        else
            render :new
        end
    end

    def edit
        @rider = Rider.find(params[:id])
    end

    def update
        @rider = Rider.find(params[:id])

        if @rider.update_attributes(rider_params)
            redirect_to rider_path(@rider)

        else
            render 'edit'
        end
    end

    def destroy
        rider = Rider.find(params[:id])
        rider.destroy
        redirect_to riders_path
    end

    def new_trip
        @rider = Rider.find(params[:id])
        puts @rider.attributes
        if new_trip_ok?
            avail_drivers = Driver.all.map { |driver| driver unless driver.trips.any? { |trip| trip.rating.nil? } }
            driver = avail_drivers.sample
            trip = @rider.trips.create(driver_id: driver.id, cost: 0.0, date: Time.now)
        end
        redirect_to rider_path
    end

    private

    def rider_params
        params.require(:rider).permit(:name, :phone_num)
    end

    def new_trip_ok?
        @rider.trips.each do |trip|
            return false if trip.rating.nil?
        end
        true
    end
end
