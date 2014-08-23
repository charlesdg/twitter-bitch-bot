class CreateFollowAction < ActiveRecord::Migration
  def change
    create_table :follow_actions do |t|
    	t.belongs_to :followers
    	t.belongs_to :users
    	t.datetime :follow_date
    	t.datetime :followback_date
      t.integer :state

      t.timestamps
    end
  end
end
