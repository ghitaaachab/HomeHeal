# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Client.destroy_all
Hcp.destroy_all
Appointment.destroy_all

10.times do |i|
  Client.create!({user_id: 1})
  Hcp.create!({user_id: 1, speciality: ['Nurse', 'Kinesitherapie', 'Thai massage', 'Doctor', 'Psychiatre'].sample, experience: rand(1..40), age: rand(21..60), availability: true, price: rand(100..1000) })
  Appointment.create!({client_id: i + 1, hcp_id: i + 1, date: Faker::Date.between(from: 30.days.ago, to: Date.today), status: ['Pending', 'Accepted', 'Rejected'].sample})
end
