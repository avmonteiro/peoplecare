class RemoveAdressFromProfessionals < ActiveRecord::Migration[5.0]
  def change
    remove_column :professionals, :adress, :string
  end
end
