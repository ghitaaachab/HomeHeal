class ListingsController < ApplicationController
  def index
    @listings = Hcp.all
  end

  def show
    @listing = Hcp.find(params[:id])
    @appointments = @listing.appointments
  end

  def search
    @listings = Listing.where("name ILIKE ?", "%#{params[:query]}%")
  end
end
