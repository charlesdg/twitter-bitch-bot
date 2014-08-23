class FollowerwonkController < ApplicationController
	
	def index
		array = [:charlesdg, :cidoum]
		@followerwonk = Followerwonk.test(array)
		p @followerwonk.class
	end

end
