class PatientsController < ApplicationController
  before_action :authenticate_professional!, only: [:nearby]

  def show
    @patients = Patient.all
    @patient = Patient.find(params[:id])
  end


  def nearby
    @patients = Patient.where("region = ? AND looking_for = ?", current_professional.region, current_professional.speciality)
  end

end
