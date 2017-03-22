class ProfessionalsController < ApplicationController

  def new
    @professional = Professional.new
  end

  def create
    @professional = Professional.new(professional_params)

      if @professional.save
        redirect_to @professional
      else
        flash[:notice] = 'Não foi possível cadastrar o profissional'
        render :new
      end
  end

  def show
    @professional = Professional.find(params[:id])
  end

private

  def professional_params
    params.require(:professional).permit(:name, :speciality, :document, :adress,
                  :neighborhood, :birthdate, :sex, :transport, :perimeter, :description,
                  :photo, :phone, :email)

  end
end
