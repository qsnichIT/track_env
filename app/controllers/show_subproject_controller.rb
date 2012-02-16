class ShowSubprojectController < ApplicationController
  def show
    @subproject = Subproject.find(params[:id])
    @comment_subprojects = @subproject.comment_subprojects
  end
end
