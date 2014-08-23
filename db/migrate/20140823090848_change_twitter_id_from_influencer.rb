class ChangeTwitterIdFromInfluencer < ActiveRecord::Migration
  def change
  	change_column :influencers, :twitter_id, :bigint
  end
end
