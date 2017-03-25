class ProfessionalsController < ApplicationController

  def show
    @professional = Professional.find(params[:id])
    @patient = Patient.all
  end

end
