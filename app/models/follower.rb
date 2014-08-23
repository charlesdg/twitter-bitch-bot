
class Follower < ActiveRecord::Base
	belongs_to :influencer

	def self.create(tweets, following, followers, username, twitter_id, location, lang, last_tweet)
		@klout_id = Klout.get_id(twitter_id)
		@follower = Follower.new
		@follower.tweets = tweets
		@follower.following = following
		@follower.followers_c = followers
		@follower.username_twitter = username
		@follower.location = location
		@follower.lang = lang
		@follower.last_tweet = last_tweet
		@follower.klout_id = @klout_id
		@follower.klout_score = Klout.get_score(@klout_id)
		@follower.twitter_id = twitter_id
		@follower.save!
	end

end
