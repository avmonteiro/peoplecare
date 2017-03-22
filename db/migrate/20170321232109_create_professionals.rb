class CreateProfessionals < ActiveRecord::Migration[5.0]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :speciality
      t.string :document
      t.string :adress
      t.string :neighborhood
      t.string :birthdate
      t.string :sex
      t.string :transport
      t.string :perimeter
      t.text :description
      t.string :photo
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
