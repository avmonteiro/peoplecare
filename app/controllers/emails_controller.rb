class EmailsController < ApplicationController
  before_action :authenticate_professional!

  def new
      @patient = Patient.find(params[:patient])
      @email = Email.new(patient: @patient)
  end


  def create
    @patient = Patient.find(params[:patient])
   @email = Email.new(email_params)
   @email.professional = current_professional
    if @email.save
      ProfessionalMailer.new_professional_contact(@email).deliver_now
      redirect_to @email
    else
      flash[:notice] = 'Dado inválido'
      @foods = Food.all
      @cookeries = Cookery.all
      render :new
  end
    #@patient = Patient.all
    #@patient = Patient.find(params[:patient]
    #ProfessionalMailer.new_professional_contact(@patient).deliver_now
    #flash[:notice] = "formulário enviado"
    #redirect_to root_path
  end

  def show
    #@patients = Patient.where("region = ? AND looking_for = ?", current_professional.region, current_professional.speciality)
  end


  private

    def email_params
    params.require(:email).permit(:patient_id, :description, :professional_id)
  end
end
