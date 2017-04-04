require 'csv'

driver_csv_text = File.read(Rails.root.join('lib', 'seeds', 'drivers.csv'))
driver_csv = CSV.parse(driver_csv_text, headers: true)

driver_csv.each do |row|
    d = Driver.new
    d.name = row['name']
    d.vin = row['vin']
    d.save
end

rider_csv_text = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))
rider_csv = CSV.parse(rider_csv_text, headers: true)

rider_csv.each do |row|
    r = Rider.new
    r.name = row['name']
    r.phone_num = row['phone_num']
    r.save
end

trip_csv_text = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))
trip_csv = CSV.parse(trip_csv_text, headers: true)

trip_csv.each do |row|
    next if row['driver_id'] == '0' || row['rider_id'] == '0'
    t = Trip.new
    t.driver_id = row['driver_id']
    t.rider_id = row['rider_id']
    t.date = row['date']
    t.rating = row['rating']
    t.cost = rand(5.0...100.0).round(2)
    t.save
end
