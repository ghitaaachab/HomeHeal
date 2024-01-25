class ListingsController < ApplicationController
  def index
    @listings = Hcp.all
    if params[:query].present?
      @listings = Hcp.search_by_speciality(params[:query])
    end
    @listing = Hcp.new
  end

  def show
    @hcp = Hcp.find(params[:id])
  end

  def book_appointment
    client = Client.where({user_id: current_user.id})
    hcp = Hcp.find(params[:id])

    appointment = Appointment.new({client_id: client, hcp_id: hcp, date: Date.today, status: "Pending"})

    if appointment.save
      redirect_to appointments_path
    else
      Rails.logger.debug(hcp.errors.full_messages)
      flash[:alert] = "Failed to book the appointment."
      raise
    end
  end
end
