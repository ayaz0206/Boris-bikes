require_relative "../lib/bike"


describe Bike do 
	
	it "should no be broken after we create it" do 
		bike = Bike.new
		expect(bike).not_to be_broken
	end
end