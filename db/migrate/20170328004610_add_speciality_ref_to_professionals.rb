class AddSpecialityRefToProfessionals < ActiveRecord::Migration[5.0]
  def change
    add_reference :professionals, :speciality, foreign_key: true
  end
end
