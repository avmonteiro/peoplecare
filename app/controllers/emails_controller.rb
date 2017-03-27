class EmailsController < ApplicationController

  def create
    #@patient = Patient.all
    @patient = Patient.find(params[:patient]
    ProfessionalMailer.new_professional_contact(@patient).deliver_now
    flash[:notice] = "formulário enviado"
    redirect_to root_path
  end

end
