class GoingController < ApplicationController
  def create
    @going = Going.new(going_params)
    if @going.save
      redirect_to venue_path(@going.venue_id)
    end
  end

  def update
    @venue = Venue.find(params[:venue_id])
    @going_up = Going.where(venue_id: @venue, user_id: current_user.id)[0]
    if @going_up.update_attributes(going_params)
      redirect_to venue_path(@going_up.venue_id)
    end
  end

  private

  def going_params
     params.require(:going).permit(:user_id, :venue_id, :going)
  end
end

