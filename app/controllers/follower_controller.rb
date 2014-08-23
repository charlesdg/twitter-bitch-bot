class FollowerController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def follow
  	require 'twitter'

  	client = Twitter::REST::Client.new do |config|
			config.consumer_key        = 'd0gj0xrOVyQ4rRxlO3ZzDFaBF'
			config.consumer_secret     = 'M3nW2BvGYk8zo8Yl9fTvFqjioDlHFQJjpkDkMeAUbQTg8B5daB'
			config.oauth_token        = '112212813-XdRoSwmoIBRe4OsTqlrSYjEgMlJs64RLXVIQHQSc'
			config.oauth_token_secret = 'QLDWQevputOaCRB0DoB dIgB1sMGACjM6oZql6mXPOBMIg'
		end


		@influencers = Array.new

		client.search("#jardinage", :result_type => "recent").take(50).collect do |tweet|
		  puts "#{tweet.user.screen_name}: #{tweet.text}"
		  unless @influencers.include? tweet.user.id
		  	Influencer.create(tweet.user.statuses_count, tweet.user.friends_count, tweet.user.followers_count, tweet.user.screen_name, tweet.user.id)
		  end
		end

		render :json => @influencers

  end

end