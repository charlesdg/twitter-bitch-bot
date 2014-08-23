class FollowerwonkController < ApplicationController
	
	def index
		array = [:charlesdg, :cidoum, :nifinet]
		@followerwonk = Followerwonk.test(array)
		p @followerwonk.class
	end

end
