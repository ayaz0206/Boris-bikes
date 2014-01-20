require_relative "../lib/docking_station"

describe DockingStation do 

	it "should accept a bike" do
		bike = Bike.new
		station = DockingStation.new
		#The station is expected to have 0 bikes
		expect(station.bike_count).to eq(0)
		#Putting a bike into the station
		station.dock(bike)
		#Now the station should have 1 bike.
		expect(station.bike_count).to eq(1)
	end


end
