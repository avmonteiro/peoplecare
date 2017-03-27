class AddDescriptionToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :description, :text
  end
end
