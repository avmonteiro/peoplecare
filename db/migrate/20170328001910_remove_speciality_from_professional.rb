class RemoveSpecialityFromProfessional < ActiveRecord::Migration[5.0]
  def change
    remove_column :professionals, :speciality, :string
  end
end
