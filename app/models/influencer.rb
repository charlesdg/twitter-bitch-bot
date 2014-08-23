class Influencer < ActiveRecord::Base
	has_many :topics
	has_many :followers

	def self.create(tweets, following, followers, username, twitter_id, location)
		@klout_id = Klout.get_id(twitter_id)
		@influencer = Influencer.new
		@influencer.tweets = tweets
		@influencer.following = following
		@influencer.followers_c = followers
		@influencer.username_twitter = username
		@influencer.location = location
		@influencer.klout_id = @klout_id
		@influencer.klout_score = Klout.get_score(@klout_id)
		@influencer.twitter_id = twitter_id
		@influencer.save!

		@influencer

		# Klout.get_topics(@klout_id).each do |topic|
		# 	@topic = Topic.new
		# 	@topic.influencer_id = @influencer.id
		# 	@topic.name = topic
		# 	@topic.save!
		# end
	end

	def self.fetch_all_followers
		Influencer.all.each do |i|
			Twitterapp.fetch_all_followers(i.username_twitter)
		end
	end

	def self.update_social_authority
		i = 1
		@followers_25 = Array.new
		Influencer.all.each do |i|
			@followers_25.push(i.username_twitter)
			#Followerwonk.get_social_authority(@followers_25)
		end
		p @followers_25
	end

end
