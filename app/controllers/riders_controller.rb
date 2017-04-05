class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end

  def show
    @rider = Rider.find(params[:id])
  end

  def new
    @rider = Rider.new
  end

  def create
    rider = Rider.create(rider_params)
    redirect_to riders_path
  end


  private

  def rider_params
    return params.require(:rider).permit(:name, :phone_num)
  end
end
