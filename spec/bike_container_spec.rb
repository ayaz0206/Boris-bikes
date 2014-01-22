require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it "should accept a bike" do
		#Holder is expected to have 0 bikes
		expect(holder.bike_count).to eq(0)
		#Putting a bike into the holder
		holder.dock(bike)
		#Now the holder is expected to habe 1 bike.
		expect(holder.bike_count).to eq(1)
	end
	
	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		fill_holder holder
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect(lambda {holder.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should not pass if it's not a bike" do
		expect(holder.dock(holder)).to be_false
	end

	it "should not release if it's empty" do
		expect(holder.empty?).to eq(true)
	end

	it "should return broken bikes to the van" do
		broken_bikes, working_bikes = Bike.new, Bike.new
		broken_bikes.break
		holder.dock(broken_bikes)
		expect(holder.broken_bikes).to eq([broken_bikes])
	end

		def fill_holder(holder)
			holder.capacity.times {holder.dock(Bike.new)}
	end

	
end