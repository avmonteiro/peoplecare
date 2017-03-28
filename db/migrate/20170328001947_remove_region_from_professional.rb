class RemoveRegionFromProfessional < ActiveRecord::Migration[5.0]
  def change
    remove_column :professionals, :region, :string
  end
end
