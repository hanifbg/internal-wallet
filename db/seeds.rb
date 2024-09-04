# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# create user
u1 = User.create!(email: "hanif@email.com", password: "password")
u2 = User.create!(email: "bagus@email.com", password: "password")

# create wallet
u1.create_wallet!(balance: 1000.00)
u2.create_wallet!(balance: 200.00)
