class ShowProjectController < ApplicationController
  layout "sessions"
    def index
    @projects = Project.where(:secret => '1')
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
end
