class Hcps::AppointmentsController < ApplicationController
  def index
    @hcp = Hcp.find(params[:hcp_id])
    @appointments = @hcp.appointments.select(:date)
    render json: @appointments
  end
end
