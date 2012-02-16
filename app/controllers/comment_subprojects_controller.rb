class CommentSubprojectsController < ApplicationController
  before_filter :login_required
  
  def create
    @subproject = Subproject.find(params[:subproject_id])      
    comment_subprojects = @subproject.comment_subprojects.build(params[:comment_subproject])
    comment_subprojects.user_id = current_user.id
    
    redirect_to(@subproject) and return if comment_subprojects.comment.blank?
    
    if comment_subprojects.save
     redirect_to  project_subproject_path(@subproject.project,@subproject), :notice => "Successfully created comment."
    else
      render "subprojects/show"
    end
  end
  
  
end
