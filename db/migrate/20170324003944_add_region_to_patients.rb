class AddRegionToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :region, :string
  end
end
