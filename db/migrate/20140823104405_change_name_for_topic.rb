class ChangeNameForTopic < ActiveRecord::Migration
  def change
  	rename_column :topics, :influencers_id, :influencer_id
  end
end
