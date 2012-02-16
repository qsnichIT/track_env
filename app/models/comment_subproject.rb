class CommentSubproject < ActiveRecord::Base
  attr_accessible :subproject_id, :comment
  belongs_to :user
  belongs_to :subproject
end
