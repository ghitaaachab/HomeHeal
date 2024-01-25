class Hcp < ApplicationRecord
  belongs_to :user
  has_many :appointments

  validates :speciality, presence: true
  validates :experience, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_speciality, against: [:speciality], using: { tsearch: { prefix: true } }
end
