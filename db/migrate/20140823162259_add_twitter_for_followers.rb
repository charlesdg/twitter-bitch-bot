class AddTwitterForFollowers < ActiveRecord::Migration
  def change
  	add_column :followers, :twitter_id, :bigint
  end
end
