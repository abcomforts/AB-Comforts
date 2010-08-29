class AddForeignToForumsForums < ActiveRecord::Migration
  def self.up
    add_column :forums_forums, :category_id, :integer
  end

  def self.down
    remove_column :forums_forums, :category_id
  end
end
