# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
Transaction.delete_all
Wallet.delete_all
User.delete_all
Team.delete_all
Stock.delete_all

# create user
u1 = User.create!(email: "hanif@email.com", password: "password")
u2 = User.create!(email: "bagus@email.com", password: "password")

# create wallet
u1.create_wallet!(balance: 1000.00)
u2.create_wallet!(balance: 200.00)

# Create Teams
team1 = Team.create!(name: 'Team Alpha', description: 'Alpha team in the organization')
team2 = Team.create!(name: 'Team Beta', description: 'Beta team in the organization')

# Create Stocks
stock1 = Stock.create!(symbol: 'AAPL', company_name: 'Apple Inc.', current_price: 145.32)
stock2 = Stock.create!(symbol: 'GOOG', company_name: 'Google LLC', current_price: 2801.12)


team1.create_wallet!(balance: 3000.00)
team2.create_wallet!(balance: 1500.00)
stock1.create_wallet!(balance: 10000.00)
stock2.create_wallet!(balance: 20000.00)
