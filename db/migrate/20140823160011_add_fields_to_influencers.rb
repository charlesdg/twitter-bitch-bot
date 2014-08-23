class AddFieldsToInfluencers < ActiveRecord::Migration
  def change
  	add_column :influencers, :location, :string
  end
end
