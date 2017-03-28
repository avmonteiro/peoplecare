class ProfessionalsController < ApplicationController
  before_action :authenticate_patient!, only: [:nearby]

  def show
    @professional = Professional.find(params[:id])
    @patient = Patient.all
  end

  def nearby
    @professionals = Professional.where("region = ? AND speciality = ?", current_patient.region, current_patient.looking_for)
  end

end
