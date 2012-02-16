class Project < ActiveRecord::Base
  has_many :comment_projects, :dependent => :destroy
  has_many :subprojects, :dependent => :destroy
  belongs_to :user
  attr_accessible :project_name, :start_date, :end_date, :secret,:detail
end
