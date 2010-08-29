class AddUserToForumsPosts < ActiveRecord::Migration
  def self.up
    add_column :forums_posts, :user_id, :integer
  end

  def self.down
    remove_column :forums_posts, :user_id
  end
end
