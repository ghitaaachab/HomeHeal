class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :hcp

  validates :date, presence: true
  validates :status, presence: true
end
