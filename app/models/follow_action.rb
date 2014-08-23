class FollowAction < ActiveRecord::Base
	belongs_to :influencer
	belongs_to :user


end
