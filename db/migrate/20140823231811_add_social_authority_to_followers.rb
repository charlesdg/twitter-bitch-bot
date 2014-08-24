class AddSocialAuthorityToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :social_authority, :decimal
  end
end
