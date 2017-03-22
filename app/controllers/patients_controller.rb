class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.find(params[:id])
    #@patient.save
    #@patient = Patient.new params_patient
  end

private
def params_patient
  params.require(:patient).permit(
  :name, :photo, :address, :neighborhood, :birthdate, :genre, :phone,
  :email, :looking_for, :document, :profession, :talk_to, :phone_contact
  )
end
end
