class Hcp < ApplicationRecord
  belongs_to :user
  has_many :appointments

  validates :speciality, presence: true
  validates :experience, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
