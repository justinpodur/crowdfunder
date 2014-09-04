class ProjectsController < ApplicationController
  before_filter :ensure_logged_in, :except => [:show, :index]
  before_filter :set_limit

  def index
  	@projects = Project.all
  
  end

  def show
  	@project = Project.find(params[:id])

    if current_user
      @pledge = @project.pledges.build
    end

  end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
    @project.owner = current_user

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def edit
  	@project = Project.find(params[:id])
  end

  def update
  	@project = Project.find(params[:id])

  	if @project.update_attributes(project_params)
  		redirect_to project_path(@project)
  	else
  		render :edit
  	end
  end

  def destroy
    @project =Project.find(params[:id])

    @project.destroy
  end 

  private 
  def project_params
  	params.require(:project).permit(:name, :description, :image, :goal_in_cents, :deadline, rewards_attributes: [:id, :name, :level, :description, :_destroy])
  end

  def set_limit
  	today = Date.today
  	two_months_away = today + 60.days
  	@limit = (today..two_months_away)
  end

end
