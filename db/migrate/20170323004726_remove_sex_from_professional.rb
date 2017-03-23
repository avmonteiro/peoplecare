class RemoveSexFromProfessional < ActiveRecord::Migration[5.0]
  def change
    remove_column :professionals, :sex, :string
  end
end
