class BugsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_user, except: :assign_bug
  before_action :find_project, except: :assign_bug
  before_action :find_bug, only: [:show, :edit, :update, :destroy]

  def index
    @bugs = @project.bugs.page(params[:page])
  end

  def new
    @bug = @project.bugs.build
  end

  def create
    @bug = @project.bugs.build(bug_params)
    @bug.user = current_user
    authorize @bug
    if @bug.save
      redirect_to user_project_bug_path(@user, @project, @bug)
    else
      render 'new'
    end
  end

  def update
    authorize @bug
    if @bug.update(bug_params)
      redirect_to user_project_bug_path(@user, @project, @bug)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @bug

    if @bug.destroy
      flash[:notice] = 'Bug was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete the bug.'
    end

    redirect_to user_project_path(@user, @project)
  end

  def assign_bug
    # Assign the bug to the current user as the developer
    @bug = Bug.find(params[:id])
    @bug.update(developer_id: current_user.id)

    redirect_to user_project_path(current_user.id, @bug.project), notice: 'Bug assigned successfully.'
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_project
    @project = @user.projects.find(params[:project_id])
  end

  def find_bug
    @bug = @project.bugs.find(params[:id])
  end

  def update_bug_status
    authorize @bug # This checks the BugPolicy
      if @bug.update(status: params[:bug][:status])
        redirect_to user_project_bug_path(@user, @project, @bug), notice: 'Bug Status was successfully updated.'
      else
        render 'show'
      end
    rescue Pundit::NotAuthorizedError
      redirect_to user_project_bug_path(@user, @project, @bug), alert: 'You do not have permission to update Bug Status.'
  end

  
  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :types, :status, :developer_id, :image)
  end

end
