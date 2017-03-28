class Professional < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :speciality_id, :document, :birthdate, :genre, :transport,
            :description, :phone, :email, :region_id, :password, presence: true

  scope :search, ->(query) { joins(:speciality, :region).where("specialities.name like ? or regions.name like ?", "%#{query}%", "%#{query}%")}

  belongs_to :region
  belongs_to :speciality


end
