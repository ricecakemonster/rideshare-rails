class TripsController < ApplicationController
    def edit
        @trip = Trip.find(params[:id])
    end

    def update
        @trip = Trip.find(params[:id])
        if @trip.update(trip_params)
            redirect_to trip_path(@trip)
        else
            render 'edit'
        end
    end

    def show
        id = params[:id].to_i
        @trip = Trip.find(id)
        session[:prev_url] = request.referer
    end

    def destroy
        trip = Trip.find(params[:id])
        trip.destroy
        redirect_to session[:prev_url]
    end

    def update_rating
        @trip = Trip.find(params[:id])
        @trip.update(trip_params)
        @rider = @trip.rider
        render 'riders/show'
    end

    # ~~~~~~~~~~~~~~~~~~~~~~~~ooooooooooooooooooooooo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    private

    def trip_params
        params.require(:trip).permit(:driver_id, :rider_id, :date, :cost, :rating)
    end
end
