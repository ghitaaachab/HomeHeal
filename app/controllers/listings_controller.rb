class ListingsController < ApplicationController
  def index
    @listings = Hcp.all
  end

  def show
    @hcp = Hcp.find(params[:id])
  end
end
