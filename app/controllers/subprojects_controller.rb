class SubprojectsController < ApplicationController
  before_filter :login_required
  #def index
    #@subprojects = Subproject.all
  #end

  def show
    @subproject = Subproject.find(params[:id])
    @comment_subprojects = @subproject.comment_subprojects
  end

  def new
    @subproject = Subproject.new
    @subproject.project_id = params[:project_id]
  end

  def create
    @subproject = Subproject.new(params[:subproject])
    if @subproject.save
      rs = CommentSubproject.new
      rs.subproject_id = @subproject.id
      rs.comment = "สร้างโครงการ #{@subproject.subname} โดย "+current_user.full_name
      rs.user_id = current_user.id
      rs.save      
      redirect_to project_subproject_path(@subproject.project,@subproject), :notice => "เพิ่มมาตรฐานเสร็จเรียบร้อย"
    else
      render :action => 'new'
    end
  end

  def edit
    @subproject = Subproject.find(params[:id])
  end

  def update
    @subproject = Subproject.find(params[:id])
    if @subproject.update_attributes(params[:subproject])
      rs = CommentSubproject.new
      rs.subproject_id = @subproject.id
      rs.comment = "แก้ไขโครงการโดย "+current_user.full_name
      rs.user_id = current_user.id
      rs.save          
      redirect_to project_subproject_path(@subproject.project,@subproject), :notice  => "แก้ไขมาตรฐานเสร็จเรียบร้อย"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @subproject = Subproject.find(params[:id])
    project_id = @subproject.project_id
    @subproject.destroy
    redirect_to project_path(project_id), :notice => "ลบมาตรฐานเสร็จเรียบร้อย"
  end
end
