class CreateInfluencers < ActiveRecord::Migration
  def change
    create_table :influencers do |t|
      t.integer :tweets
      t.integer :following
      t.integer :followers
      t.string :username_twitter
      t.string :klout_id
      t.integer :klout_score

      t.timestamps
    end
  end
end
