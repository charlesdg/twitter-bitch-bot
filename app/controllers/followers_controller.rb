class FollowersController < ApplicationController
  def index
  	@followers = Follower.order("klout_score DESC")
  end
end
