class AddDetailToSubproject < ActiveRecord::Migration
  def self.up
    add_column :subprojects, :detail, :text
  end

  def self.down
    remove_column :subprojects, :detail
  end
end
