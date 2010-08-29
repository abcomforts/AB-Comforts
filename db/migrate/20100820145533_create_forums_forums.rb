class CreateForumsForums < ActiveRecord::Migration
  def self.up
    create_table :forums_forums do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :forums_forums
  end
end
