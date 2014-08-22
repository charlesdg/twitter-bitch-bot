class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.belongs_to :influencers
      t.string :name

      t.timestamps
    end
  end
end
