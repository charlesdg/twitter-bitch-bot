class FollowerwonkController < ApplicationController
	
	def index
		users = [:charlesdg, :cidoum, :nifinet, :jonschock]
		@data = Followerwonk.get_social_authority(users)
	end

end
