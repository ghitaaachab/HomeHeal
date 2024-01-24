class ListingsController < ApplicationController
  def index
    @listings = Hcp.all
  end

  def show
    @listing = Hcp.find(params[:id])
    @appointments = @hcp.appointments
  end

  def book_appointment
    user_id = params[:user_id]
    hcp_id = params[:hcp_id]
    selected_date = params[:selected_date]

    # Perform the booking logic here, e.g., create a new appointment
    Appointment.create(user_id: user_id, hcp_id: hcp_id, date: selected_date)

    redirect_to hcp_path(hcp_id), notice: 'Appointment booked successfully.'
  end
end
