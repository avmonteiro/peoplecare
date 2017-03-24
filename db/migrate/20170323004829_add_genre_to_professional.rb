class AddGenreToProfessional < ActiveRecord::Migration[5.0]
  def change
    add_column :professionals, :genre, :string
  end
end
