class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :photo, :name, :genre, :birthdate, :address,
  :phone, :looking_for, :talk_to, :phone_contact, :region,  presence: true

end
