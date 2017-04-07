class DriversController < ApplicationController
    def index
        @drivers = Driver.all
    end

    def new
        @driver = Driver.new
    end

    def create
        new
        if @driver.update(driver_params)
            redirect_to drivers_path
        else
            render 'new'
        end
    end

    def edit
        @driver = Driver.find(params[:id])
    end

    def update
        @driver = Driver.find(params[:id])
        if @driver.update(driver_params)
            redirect_to driver_path(@driver)
        else
            render 'edit'
        end
    end

    def show
        id = params[:id].to_i
        @driver = Driver.find(id)
        session[:prev_url] = request.referer
    end

    def destroy
        driver = Driver.find(params[:id])
        driver.destroy
        redirect_to drivers_path
    end

    # ~~~~~~~~~~~~~~~~~~~~~~~~ooooooooooooooooooooooo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private

    def driver_params
        params.require(:driver).permit(:name, :vin)
    end
end
