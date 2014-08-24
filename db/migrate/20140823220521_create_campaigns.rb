class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
    	t.belongs_to :users
    	t.string :name

      t.timestamps
    end
  end
end
