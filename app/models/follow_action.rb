class FollowAction < ActiveRecord::Base
	belongs_to :influencer
	belongs_to :user

	NOFOLLOW   = 0
  FOLLOW  = 1
  ALREADY_FOLLOWED   = 2

  scope :nofollow, where(:state => NOFOLLOW)
  scope :follow, where(:creation_state => FOLLOW)
  scope :already_followed, where(:creation_state => ALREADY_FOLLOWED)

end
