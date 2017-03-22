class Patient < ApplicationRecord
  validates :photo, :name, :genre, :birthdate, :address,
  :phone, :looking_for, :talk_to, :phone_contact,  presence: true
end
