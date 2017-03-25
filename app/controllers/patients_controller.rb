class PatientsController < ApplicationController
  before_action :authenticate_professional!, only: [:nearby]

  def show
    @patients = Patient.all
    @patient = Patient.find(params[:id])
  end

  def nearby
    @patients = Patient.where(region: current_professional.region)
  end

end
