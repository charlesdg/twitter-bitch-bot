class Influencer < ActiveRecord::Base
	has_many :topics

	def self.create(tweets, following, followers, username, twitter_id)
		@influencer = Influencer.new
		@influencer.tweets = tweets
		@influencer.following = following
		@influencer.followers = followers
		@influencer.username_twitter = username
		@influencer.klout_id = nil
		@influencer.klout_score = nil
		@influencer.twitter_id = twitter_id
		@influencer.save!
	end
end
