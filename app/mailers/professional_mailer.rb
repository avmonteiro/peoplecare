class ProfessionalMailer < ApplicationMailer
  default from: 'henriquepjv@hotmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.professional_mailer.new_professional_contact.subject
  #
  def new_professional_contact(email)
    @email = email

    mail(to: "henriquepjv@gmail.com", subject: "oi")
  end
end
