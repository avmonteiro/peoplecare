class Professional < ApplicationRecord

validates :name, :speciality, :document, :birthdate, :sex, :transport,
          :description, :phone, :email, presence: true

end
