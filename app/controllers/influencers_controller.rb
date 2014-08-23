class InfluencersController < ApplicationController
  def index
  	@influencers = Influencer.all
  end
end
