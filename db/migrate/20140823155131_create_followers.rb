class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :tweets
      t.integer :following
      t.integer :followers
      t.string :username_twitter
      t.string :klout_id
      t.integer :klout_score
      t.string :location
      t.string :lang
      t.datetime :last_tweet
      t.integer :influencer_id
      t.timestamps
    end
  end
end