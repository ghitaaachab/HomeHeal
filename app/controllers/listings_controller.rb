class ListingsController < ApplicationController
  def index
    @listings = Hcp.all
    if params[:query].present?
      @listings = Hcp.search_by_speciality(params[:query])
    end
  end

  def show
    @listing = Hcp.find(params[:id])
    @appointments = @listing.appointments
  end
end
