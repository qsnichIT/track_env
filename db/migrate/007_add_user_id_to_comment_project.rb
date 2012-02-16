class AddUserIdToCommentProject < ActiveRecord::Migration
  def self.up
    add_column :comment_projects, :user_id, :integer
  end

  def self.down
    remove_column :comment_projects, :user_id
  end
end
