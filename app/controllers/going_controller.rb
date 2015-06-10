class GoingController < ApplicationController

  def create
    @going = Going.new(going_params)
    if @going.save
      redirect_to venue_path(@going.venue_id)
    end
  end

  def update

  end

  private

  def going_params
     params.require(:going).permit(:user_id, :venue_id, :going)
  end
end

