class AppointmentsController < ApplicationController

  def index
    # this is the condition below we're going to use, but for the sake of testing we will import all appointments at the moment
    # @appointments = Appointement.where(client_id: current_user.id)
    @appointments = Appointement.all

  end

  def create
    appointment_infos = {date: appointment_params.date, hcp_id: appointment_params.hcp_id, client_id: Client.where(user_id: current_user.id).id, status: "Pending"}
    @appointment = Appointement.new(appointment_infos)
    @appointment.save
    redirect_to listings_path
  end

  private

  def appointment_params
    params.require(:appointement).permit(:date, :hcp_id)
  end

end
