class TripsController < ApplicationController
    def edit
        @trip = Trip.find(params[:id])
    end

    def update
        edit
        if @trip.update(trip_params)
            redirect_to trip_path(@trip)
        else
            render 'edit'
        end
    end

    def show
        id = params[:id].to_i
        @trip = Trip.find(id)
    end

    def destroy
        trip = Trip.find(params[:id])
        trip.destroy
        redirect_to :back
    end

    # ~~~~~~~~~~~~~~~~~~~~~~~~ooooooooooooooooooooooo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    private

    def trip_params
        params.require(:trip).permit(:driver_id, :rider_id, :date, :cost, :rating)
    end

    def update_rating
        trip = Trip.find(params[:id])
        if trip.update(trip_params)
            redirect_to trips_path(trip)
        else
            redirect_to rider_path(@rider)
        end
    end
end
