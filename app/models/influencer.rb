class Influencer < ActiveRecord::Base
	has_many :topics

	def self.create(tweets, following, followers, username, twitter_id)
		@klout_id = Klout.get_id(twitter_id)
		@influencer = Influencer.new
		@influencer.tweets = tweets
		@influencer.following = following
		@influencer.followers = followers
		@influencer.username_twitter = username
		@influencer.klout_id = @klout_id
		@influencer.klout_score = Klout.get_score(@klout_id)
		@influencer.twitter_id = twitter_id
		@influencer.save!
	end

end
