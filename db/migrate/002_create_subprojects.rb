class CreateSubprojects < ActiveRecord::Migration
  def self.up
    create_table :subprojects do |t|
      t.integer :project_id
      t.string :subname
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end

  def self.down
    drop_table :subprojects
  end
end
