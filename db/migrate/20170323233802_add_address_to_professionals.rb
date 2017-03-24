class AddAddressToProfessionals < ActiveRecord::Migration[5.0]
  def change
    add_column :professionals, :address, :string
  end
end
