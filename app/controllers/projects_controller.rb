class ProjectsController < ApplicationController
  before_action :find_user, only: [:index, :new, :create, :edit]
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.for_user(current_user).page(params[:page])
  end

  def show
    @user = @project.user
    @bugs = @project.bugs
  end

  def new
    @project = @user.projects.build
  end

  def create
    @user = current_user
    @project = @user.projects.build(project_params)
    authorize @project

    if @project.save
      redirect_to user_project_path(@user, @project)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    authorize @project

    if @project.update(project_params)
      redirect_to user_project_path(@project.user, @project)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @project

    if @project.destroy
      flash[:notice] = 'Project was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete the project.'
    end

    redirect_to user_projects_path(@project.user)
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :technologies, assignee_ids: [])
  end

  def find_user
    @user = current_user
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
