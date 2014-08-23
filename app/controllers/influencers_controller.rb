class InfluencersController < ApplicationController

	def index
		@influencers = Influencer.order("created_at desc")
	end

end