class CommentProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :project_id, :comment
  validates_presence_of :comment
end
