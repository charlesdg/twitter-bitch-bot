class InfluencersController < ApplicationController
  def index
  	@influencers = Influencer.order("klout_score DESC")
  end
end
