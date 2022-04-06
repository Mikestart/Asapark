require "json"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Spot.destroy_all

# puts "Creating spots..."
# spot1 = Spot.new(address: "57 rue de la Buffa, 06000 Nice", latitude: 43.6963, longitude: 7.2583, spot_number: 2)
# spot1.save!
# spot2 = Spot.new(address: "2 rue Nathalie Masse, 06000 Nice", latitude: 43.7115, longitude: 7.2825, spot_number: 1)
# spot2.save!
# spot3 = Spot.new(address: "5 rue Jean François Fulconis, 06000 Nice", latitude: 43.7234, longitude: 7.2857, spot_number: 2)
# spot3.save!
# puts "Finished!"


filepath = "disabled_spots.json"
disabled = JSON.parse(File.read(filepath))
parks = disabled.values[0]

  parks.each do |element|
    address = "#{element["NUM"].to_i} #{element["NOM_VOIE"]}"
    spot_number = element["NB_PLACE"].to_i
    latitude = element["geometry"]["coordinates"][1]
    longitude = element["geometry"]["coordinates"][0]
    spot = Spot.create!(address: address, spot_number: spot_number, latitude: latitude, longitude: longitude)
  end
