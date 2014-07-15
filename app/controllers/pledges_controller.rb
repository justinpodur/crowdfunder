class PledgesController < ApplicationController
  before_filter :load_project
  before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]

  def show
  	@pledge = Pledge.find(params[:id])
  end

  def create
  	@pledge = @project.pledges.build(pledge_params)
  	@pledge.user_id = current_user.id

  if @pledge.save
  	redirect_to projects_path, notice: 'Pledge created successfully'
  else
  	render 'projects/show'
  end

  end

  def destroy
  	@pledge = Pledge.find(params[:id])
  	@pledge.destroy
  end

  private
  def pledge_params
  	params.require(:pledge).permit(:amount_in_cents, :project_id)
  end

  def load_project
  	@project = Project.find(params[:project_id])
  end
  
end
