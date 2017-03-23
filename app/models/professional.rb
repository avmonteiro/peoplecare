class Professional < ApplicationRecord

validates :name, :speciality, :document, :birthdate, :sex, :transport,
          :description, :phone, :email, presence: true


scope :search, ->(query) { where("speciality like ? or region like ?", "%#{query}%", "%#{query}%")} 

end
