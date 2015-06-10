class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @going = Going.new()
    @going_up = Going.where(venue_id: @venue, user_id: current_user.id)[0]
  end

end
