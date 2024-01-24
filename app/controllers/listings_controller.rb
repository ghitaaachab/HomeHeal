class ListingsController < ApplicationController
  def index
    @listings = Hcp.all
  end

  def show
    @listing = Hcp.find(params[:id])
    @appointments = @listing.appointments
  end
end
