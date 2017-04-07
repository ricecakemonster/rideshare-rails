class TripsController < ApplicationController
    def edit
        @trip = Trip.find(params[:id])
    end

    def update
        trip = Trip.find(params[:id])
        if trip.update(trip_params)
            redirect_to trip_path(trip)
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
        redirect_to trips_path
    end

    def update_rating
        trip = Trip.find(params[:id])
        if trip.update(trip_params)
            redirect_to trips_path(trip)
        else
            redirect_to rider_path(@rider)
        end
    end

    private

    def trip_params
      return params.require(:trip).permit(:rating)
    end

end
