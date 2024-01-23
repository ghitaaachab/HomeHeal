class ListingsController < ApplicationController
  def index
    @listings = Hcp.all
  end

  def show
    @number = params[:id]
  end
end
