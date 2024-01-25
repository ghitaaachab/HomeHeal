class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :client
  has_one :hcp
  attribute :role, :integer, default: 0
  enum role: [:client, :hcp]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
