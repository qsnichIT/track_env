class AddStatusToSubproject < ActiveRecord::Migration
  def self.up
    add_column :subprojects, :status, :string
  end

  def self.down
    remove_column :subprojects, :status
  end
end
