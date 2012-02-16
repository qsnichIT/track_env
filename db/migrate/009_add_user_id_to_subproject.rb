class AddUserIdToSubproject < ActiveRecord::Migration
  def self.up
    add_column :subprojects, :user_id, :integer
  end

  def self.down
    remove_column :subprojects, :user_id
  end
end
