class CreateCommentSubprojects < ActiveRecord::Migration
  def self.up
    create_table :comment_subprojects do |t|
      t.integer :subproject_id
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :comment_subprojects
  end
end
