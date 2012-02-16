class Subproject < ActiveRecord::Base
  belongs_to :project
  has_many :comment_subprojects, :dependent => :destroy
  belongs_to :user
  attr_accessible :project_id, :subname, :start_date, :end_date,:status,:detail
end
