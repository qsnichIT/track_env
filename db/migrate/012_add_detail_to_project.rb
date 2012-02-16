class AddDetailToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :detail, :text
  end

  def self.down
    remove_column :projects, :detail
  end
end
