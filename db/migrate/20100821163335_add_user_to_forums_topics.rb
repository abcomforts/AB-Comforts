class AddUserToForumsTopics < ActiveRecord::Migration
  def self.up
    add_column :forums_topics, :user_id, :integer
  end

  def self.down
    remove_column :forums_topics, :user_id
  end
end
