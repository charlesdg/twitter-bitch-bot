class Topic < ActiveRecord::Base
	belongs_to :influencer

	def self.create(influencer, name)
		@topic = Topic.new
		@topic.name = name
		@topic.influencer = influencer
		@topic.save!
	end
end
