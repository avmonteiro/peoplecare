class Region < ApplicationRecord
  has_many :professionals
  has_many :patients
end
