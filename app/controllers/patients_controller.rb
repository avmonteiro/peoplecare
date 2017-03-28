class PatientsController < ApplicationController
  before_action :authenticate_professional!, only: [:nearby]

  def show
    @patient = Patient.find(params[:id])
  end


  def create
    @regions = Region.all
    @specialities = Speciality.all
  end

  def nearby
    @patients = Patient.joins(:region).where("regions.name like ?", current_professional.region)


  end

end
