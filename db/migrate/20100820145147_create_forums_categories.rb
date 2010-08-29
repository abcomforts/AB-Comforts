class CreateForumsCategories < ActiveRecord::Migration
  def self.up
    create_table :forums_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :forums_categories
  end
end
