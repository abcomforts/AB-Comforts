class AddForeignToForumsPosts < ActiveRecord::Migration
  def self.up
    add_column :forums_posts, :topic_id, :integer
  end

  def self.down
    remove_column :forums_posts, :topic_id
  end
end
