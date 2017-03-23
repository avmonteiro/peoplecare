class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new params_patient
    if @patient.save
      redirect_to @patient
    else
      flash[:notice] = 'Não foi possível cadastrar o paciente'
      render :new
    end

  end

  def show
    @patient = Patient.find(params[:id])
  end

  private
  def params_patient
    params.require(:patient).permit(
    :name, :photo, :address, :neighborhood, :birthdate, :genre, :phone,
    :email, :looking_for, :document, :profession, :talk_to, :phone_contact
    )
  end
end