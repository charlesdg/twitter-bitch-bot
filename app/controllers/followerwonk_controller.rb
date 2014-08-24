class FollowerwonkController < ApplicationController
	
	def index
		users = [:charlesdg, :cidoum, :nifinet, :jonschock]
		@data = Followerwonk.get_social_authority(users)
	end

	def worker
		FollowerwonkWorker.perform_async

		head 204
	end

end
