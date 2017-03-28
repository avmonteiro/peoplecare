class AddRegionRefToProfessionals < ActiveRecord::Migration[5.0]
  def change
    add_reference :professionals, :region, foreign_key: true
  end
end
