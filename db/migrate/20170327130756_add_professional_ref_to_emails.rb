class AddProfessionalRefToEmails < ActiveRecord::Migration[5.0]
  def change
    add_reference :emails, :professional, foreign_key: true
  end
end
