class Twitterapp < ActiveRecord::Base
	
	require 'twitter'

	@@client = Twitter::REST::Client.new do |config|
		config.consumer_key        = 'ntJjYSJ26B60j0f19KubQDVYf'
		config.consumer_secret     = '2MJ3uUfomyLOk0pnwOSXjFz4AxDZjAGMbQmbvnL0aMJiN3j3Ab'
		config.oauth_token        = '2756462101-3eJsWGUu5mCrSl8As6gNrgZIJ1frPdLRJMnSWRJ'
		config.oauth_token_secret = 'aO8VU5YYxD7MkcDgAZc8rj5sCozow34FBrn7KXLHh5mcf'
	end

		def self.follow
			@@client.follow("cidoum")
		end

		def self.unfollow
			@@client.unfollow("cidoum")
		end

		def self.search_keyword(keyword, occurence)
			@influencers = Array.new
			@@client.search(keyword, :result_type => "recent").take(occurence).collect do |tweet|
				#puts "#{tweet.user.screen_name}: #{tweet.text}"
				unless @influencers.include? tweet.user.id
					@influencers.push(tweet.user.id)
					Influencer.create(tweet.user.statuses_count, tweet.user.friends_count, tweet.user.followers_count, tweet.user.screen_name, tweet.user.id)
				end
			end
			@influencers.count
		end

end