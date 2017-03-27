# Preview all emails at http://localhost:3000/rails/mailers/professional_mailer
class ProfessionalMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/professional_mailer/new_professional_contact
  def new_professional_contact
    patient = Patient.last
    ProfessionalMailer.new_professional_contact(patient)
  end


end
