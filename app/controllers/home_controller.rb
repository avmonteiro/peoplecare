class HomeController < ApplicationController

def index

 if params[:search]
   @search_professional = Professional.search(params[:search])
 end
end

end
