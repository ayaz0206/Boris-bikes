require_relative "../lib/docking_station"

describe DockingStation do 

	let(:bike) {Bike.new}
	let(:station) {DockingStation.new}

	it "should accept a bike" do
		#The station is expected to have 0 bikes
		expect(station.bike_count).to eq(0)
		#Putting a bike into the station
		station.dock(bike)
		#Now the station should have 1 bike.
		expect(station.bike_count).to eq(1)
	end

	it "should release a bike" do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end



end
