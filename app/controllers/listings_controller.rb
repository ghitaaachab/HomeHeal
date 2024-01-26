class ListingsController < ApplicationController
  before_action :authenticate_client, only: [:index, :show, :book_appointment]

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
    client = Client.where(user_id: current_user.id).first
    hcp = Hcp.find(params[:id])

    appointment = Appointment.new(client_id: client.id, hcp_id: hcp.id, date: Date.today, status: "Pending")

    if appointment.save
      redirect_to appointments_path 
    else
      flash[:alert] = "Failed to book the appointment."
      raise
    end
  end

  private

  def authenticate_client
    hcp = Hcp.find_by(user_id: current_user.id)
    redirect_to appointments_path, alert: "Only Clients have access to this page." if !hcp.nil?
  end
end
