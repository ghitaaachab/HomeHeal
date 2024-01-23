class Appointement < ApplicationRecord
  belongs_to :client
  belongs_to :hcp
end
