class AppointmentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_appointment, only: [:accept, :reject]

  def index
    # this is the condition below we're going to use, but for the sake of testing we will import all appointments at the moment
    # @appointments = Appointement.where(client_id: current_user.id)
    @appointments = current_user.client.appointments if current_user.client
    @appointments ||= current_user.hcp.appointments if current_user.hcp

    @user_role = current_user.client.present? ? 'client' : 'hcp'
  end

  def create
    appointment_infos = {date: appointment_params.date, hcp_id: appointment_params.hcp_id, client_id: Client.where(user_id: current_user.id).id, status: "Pending"}
    @appointment = Appointement.new(appointment_infos)
    @appointment.save
    redirect_to listings_path
  end

  def accept
    @appointment.update(status: 'Accepted')
    redirect_to appointments_path, notice: 'Appointment accepted!'
  end

  def reject
    @appointment.update(status: 'Rejected')
    redirect_to appointments_path, notice: 'Appointment rejected!'
  end

  private

  def appointment_params
    params.require(:appointement).permit(:date, :hcp_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

end
