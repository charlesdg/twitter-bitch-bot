class FollowerwonkWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform
  	puts '--- WORKER ---'
  	followers = Follower.where(social_authority: nil).first(25)

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

	    followers.each do |a|
	    	puts a.inspect
	    	if a.social_authority.nil?
	    		puts 'debug !'
	    		puts a.inspect
	    		a.update_attribute(:social_authority, 0.0)
	    	end
	    end	

	    followers = Follower.select(:username_twitter).where(social_authority: nil).first(25)
	    puts '--- followers-size ---'
	    puts followers.size
  	end
	  	

  end
end