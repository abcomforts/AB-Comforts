class AddForeignToForumsTopic < ActiveRecord::Migration
  def self.up
    add_column :forums_topics, :forum_id, :integer
  end

  def self.down
    remove_column :forums_topics, :forum_id
  end
end
