class AddTwitterIdToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :twitter_id, :integer
  end
end
