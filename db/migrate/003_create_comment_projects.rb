class CreateCommentProjects < ActiveRecord::Migration
  def self.up
    create_table :comment_projects do |t|
      t.integer :project_id
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :comment_projects
  end
end
