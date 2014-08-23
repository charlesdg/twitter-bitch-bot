class RenameFollowersForInfluencers < ActiveRecord::Migration
  def change
  	rename_column :influencers, :followers, :followers_c
  	rename_column :followers, :followers, :followers_c
  end
end
