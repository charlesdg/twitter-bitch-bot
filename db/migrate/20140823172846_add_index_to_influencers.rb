class AddIndexToInfluencers < ActiveRecord::Migration
  def change
  	add_index :influencers, :twitter_id, :unique => true
  	add_index :followers, :twitter_id, :unique => true
  end
end
