class AddRegionToProfessional < ActiveRecord::Migration[5.0]
  def change
    add_column :professionals, :region, :string
  end
end
