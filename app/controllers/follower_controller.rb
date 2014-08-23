class FollowerController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def follow
  	require 'twitter'

  	client = Twitter::REST::Client.new do |config|
			config.consumer_key        = 'ntJjYSJ26B60j0f19KubQDVYf'
			config.consumer_secret     = '2MJ3uUfomyLOk0pnwOSXjFz4AxDZjAGMbQmbvnL0aMJiN3j3Ab'
			config.oauth_token        = '2756462101-3eJsWGUu5mCrSl8As6gNrgZIJ1frPdLRJMnSWRJ'
			config.oauth_token_secret = 'aO8VU5YYxD7MkcDgAZc8rj5sCozow34FBrn7KXLHh5mcf'
		end

		@influencers = Array.new

		client.search("#startup", :result_type => "recent").take(50).collect do |tweet|
		  puts "#{tweet.user.screen_name}: #{tweet.text}"
		  unless @influencers.include? tweet.user.id
		  	@influencers.push(tweet.user.id)
		  	Influencer.create(tweet.user.statuses_count, tweet.user.friends_count, tweet.user.followers_count, tweet.user.screen_name, tweet.user.id)
		  end
		end

		render :json => @influencers

  end

end