class HomeController < ApplicationController

  def index
   if params[:search]
     @search_professional = Professional.search(params[:search])
   end
   @professionals = Professional.all
  end

end
