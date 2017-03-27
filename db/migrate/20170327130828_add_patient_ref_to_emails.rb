class AddPatientRefToEmails < ActiveRecord::Migration[5.0]
  def change
    add_reference :emails, :patient, foreign_key: true
  end
end
