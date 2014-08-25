class FollowerwonkWorker
  include Sidekiq::Worker
  def perform
  	puts '--- WORKER ---'
  	followers = Follower.select(:username_twitter).where(social_authority: nil).first(25)

  	while !followers.empty?
  		array = Array.new
	  	followers.each do |f|
	  		array << f.username_twitter
	  	end

	    data = Followerwonk.get_social_authority(array)

	    data.each do |d|
	    	f = Follower.find_by(username_twitter: d[:screen_name])
	    	f.social_authority = d[:social_authority]
	    	f.save!
	    end
	    followers = Follower.select(:username_twitter).where(social_authority: nil).first(25)
  	end
	  	

  end
end