class CreateForumsPosts < ActiveRecord::Migration
  def self.up
    create_table :forums_posts do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :forums_posts
  end
end
