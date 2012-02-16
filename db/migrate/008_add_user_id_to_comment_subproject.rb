class AddUserIdToCommentSubproject < ActiveRecord::Migration
  def self.up
    add_column :comment_subprojects, :user_id, :integer
  end

  def self.down
    remove_column :comment_subprojects, :user_id
  end
end
