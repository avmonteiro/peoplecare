class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

   def configure_permitted_parameters

     if resource_class == Professional
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :speciality_id, :document, :adress,
                     :neighborhood, :region_id, :birthdate, :genre, :transport, :perimeter, :description,
                     :photo, :phone])
     end

     if resource_class == Patient
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo, :address, :neighborhood,
                     :birthdate, :genre, :phone, :email, :speciality_id, :document,
                     :profession, :talk_to, :phone_contact, :region_id])
     end
   end

end
