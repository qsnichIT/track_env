class CommentProjectsController < ApplicationController
  before_filter :login_required
  def create
    @project = Project.find(params[:project_id])      
    comment_projects = @project.comment_projects.build(params[:comment_project])
    comment_projects.user_id = current_user.id
    redirect_to(@project) and return if comment_projects.comment.blank?
    
    if comment_projects.save
     redirect_to @project, :notice => "Successfully created comment."
    else
      render "projects/show"
    end
  end
end
