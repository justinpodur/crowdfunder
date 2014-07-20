class RewardsController < ApplicationController
  before_filter :load_project
  before_filter :ensure_logged_in, :only => [:create, :destroy, :edit, :show, :update]

  def show
  	@reward = Reward.find(params[:id])
  end

  def edit
  	@reward = Reward.find(params[:id])
  end

  def update
  	@reward = Reward.find(params[:id])

  	if @reward.update_attributes(reward_params)
  		redirect_to project_rewards_path(@reward)
  	else 
  		render "edit"
  	end
  end

  def create
  	@reward = @project.rewards.build(reward_params)
  	@reward.user_id = current_user.id 

  	if @reward.save
  		redirect_to @reward
  	else 
  		render 'projects/show'
  	end
  end

  def destroy
  	@reward = Reward.find(params[:id])

  	@reward.destroy
    redirect_to edit_project_path(params[:project_id])
  end

  private
  def reward_params
  	params.require(:reward).permit(:level, :name, :description)
  end

  def load_project
  	@project = Project.find(params[:project_id])
  end
end
