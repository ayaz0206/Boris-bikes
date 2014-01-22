module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "Station is full" if full?
		return false if !bike.is_a?(Bike)
		bikes << bike
	end

	def release(bike)
		bikes.delete(bike)
	end

	# def empty?
	# 	@bikes.count
	# end



	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken? }
	end

end
