class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :photo, :name, :genre, :birthdate, :address, :email, :password, :region,
  :phone, :talk_to, :speciality_id, :phone_contact, :region_id,  presence: true

  has_many :emails

  belongs_to :region
  belongs_to :speciality
end
