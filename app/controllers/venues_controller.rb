class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @going = Going.new()
  end

end
