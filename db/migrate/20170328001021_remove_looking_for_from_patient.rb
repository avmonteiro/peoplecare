class RemoveLookingForFromPatient < ActiveRecord::Migration[5.0]
  def change
    remove_column :patients, :looking_for, :string
  end
end
