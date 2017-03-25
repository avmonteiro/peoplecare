class PatientsController < ApplicationController
  before_action :authenticate_professional!, only: [:nearby]

  def show
    @patients = Patient.all
    @patient = Patient.find(params[:id])
  end

  def nearby
    @patients = Patient.where(region: current_professional.region)
  end

  private

  def params_patient
    params.require(:patient).permit(
    :name, :photo, :address, :neighborhood, :birthdate, :genre, :phone,
    :email, :looking_for, :document, :profession, :talk_to, :phone_contact, :region
    )
  end

end
