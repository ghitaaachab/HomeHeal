class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_role_choice, only: [:new]

  def new
  end

  def create
    if params[:role_choice] == 'hcp'
      register_hcp
      redirect_to appointments_path
    elsif params[:role_choice] == 'client'
      register_client
      redirect_to listings_path
    end


  end

  private

  def ensure_role_choice
    user = current_user

    if Hcp.exists?(user_id: user.id) || Client.exists?(user_id: user.id)
      redirect_to listings_path
    end
  end

  def register_hcp
    user = current_user
    hcp = Hcp.new(user: user, speciality: params[:speciality], experience: params[:experience], price: params[:price], biography: params[:biography])

    if hcp.save
      user.update(role: :hcp, hcp: hcp)
    else
      Rails.logger.debug(hcp.errors.full_messages)
      flash[:alert] = "Failed to save the HCP."
    end
  end

  def register_client
    user = current_user
    client = Client.new(user: user)

    if client.save
      user.update(role: :client, client: client)
    else
      Rails.logger.debug(client.errors.full_messages)
      flash[:alert] = "Failed to save the Client."
    end
  end

  def hcp_params
    params.permit(:speciality, :experience, :age, :price, :biography)
  end
end
