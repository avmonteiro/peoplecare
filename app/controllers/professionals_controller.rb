class ProfessionalsController < ApplicationController
  before_action :authenticate_patient!, only: [:nearby]

  def show
    @professional = Professional.find(params[:id])
    @patient = Patient.all
  end

  def nearby
    @professionals = Professional.joins(:region).where("regions.name like ?", current_patient.region.name)
  end

end
