class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end

  def show
  	@project = Project.find(params[:id])
  end

  def new
  	@project = Project.new
  	set_limit
  end

  def edit
  	@project = Project.find(params[:id])
  end

  def create
  	@project = Project.new(project_params)
  	set_limit

  	if @project.save
  		redirect_to projects_url
  	else
  		render :new
  	end
  end

  def update
  	@project = Project.find(params[:id])

  	if @project.update_attributes(product_params)
  		redirect_to project_path(@project)
  	else
  		render :edit
  	end
  end



  private 
  def project_params
  	params.require(:project).permit(:name, :description, :goal_in_cents, :deadline)
  end

  def set_limit
  	today = Date.today
  	two_months_away = today + 60.days
  	@limit = (today..two_months_away)
  end

end
