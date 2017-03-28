class RemoveRegionFromPatient < ActiveRecord::Migration[5.0]
  def change
    remove_column :patients, :region, :string
  end
end
