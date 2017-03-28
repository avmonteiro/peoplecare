class AddSpecialityRefToPatients < ActiveRecord::Migration[5.0]
  def change
    add_reference :patients, :speciality, foreign_key: true
  end
end
