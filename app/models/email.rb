class Email < ApplicationRecord
  belongs_to :professional
  belongs_to :patient
end
