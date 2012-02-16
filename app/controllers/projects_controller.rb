class ProjectsController < ApplicationController
  before_filter :login_required
  def index
    @projects = Project.all
    @dt = Time.new.to_date
    for i in 0...@projects.length
      @projects[i][:class_name] = ""
      @projects[i][:status] = "เสร็จเรียบร้อย"
      if @projects[i].subprojects.length > 0
        sub = @projects[i].subprojects
        for j in 0...sub.length
          if @projects[i].subprojects[j].end_date < @dt and @projects[i].subprojects[j].status == "0"
            @projects[i][:class_name] = "work-load"
            @projects[i][:status] = "กำลังดำเนินการ"
          end
          if @projects[i].subprojects[j].status == "0"
              @projects[i][:status] = "กำลังดำเนินการ"
          end
        end
      end
    end
  end

  def show
    @project = Project.find(params[:id])
    @comment_projects = @project.comment_projects
    @subprojects = @project.subprojects
    @dt = Time.new.to_date
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    if @project.save
      rs = CommentProject.new
      rs.project_id = @project.id
      rs.comment = "สร้างโครงการ #{@project.project_name} โดย "+current_user.full_name
      rs.user_id = current_user.id
      rs.save
      redirect_to @project, :notice => "เพิ่มโครงการเสร็จเรียบร้อย"
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      rs = CommentProject.new
      rs.project_id = @project.id
      rs.comment = "แก้ไขโครงการโดย "+current_user.full_name
      rs.user_id = current_user.id
      rs.save
      
      
      redirect_to @project, :notice  => "แก้ไขโครงการเสร็จเรียบร้อย"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, :notice => "ลบโครงการเสร็จเรียบร้อย"
  end
end
