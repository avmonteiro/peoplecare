class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :photo
      t.string :name
      t.string :address
      t.string :neighborhood
      t.string :birthdate
      t.string :genre
      t.string :phone
      t.string :email
      t.string :looking_for
      t.string :document
      t.string :profession
      t.string :talk_to
      t.string :phone_contact

      t.timestamps
    end
  end
end
