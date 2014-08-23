module API
	class TwitterController < ApiController

		require 'twitter'

		client = Twitter.configure do |config|
			config.consumer_key        = 'd0gj0xrOVyQ4rRxlO3ZzDFaBF'
			config.consumer_secret     = 'M3nW2BvGYk8zo8Yl9fTvFqjioDlHFQJjpkDkMeAUbQTg8B5daB'
			config.oauth_token        = '112212813-XdRoSwmoIBRe4OsTqlrSYjEgMlJs64RLXVIQHQSc'
			config.oauth_token_secret = 'QLDWQevputOaCRB0DoBdIgB1sMGACjM6oZql6mXPOBMIg'
		end

		def follow
			render :json => client.follow(params[:twitter_id])
		end

		def unfollow
			render :json => client.unfollow(params[:twitter_id])
		end

	end
end