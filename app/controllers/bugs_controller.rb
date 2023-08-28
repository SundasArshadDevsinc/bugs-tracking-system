class BugsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    before_action :find_user   
    before_action :find_project 
    before_action :find_bug, only: [:show, :edit, :update, :destroy]
  
    def index
      # Fetch all bugs associated with the project
      
      @bugs = @project.bugs
    end
  
    def show
      # The bug is already loaded by the `before_action :find_bug` callback.
    end
  
    def new
        @bug = @project.bugs.build
  
    end
  
    def create
        
      @bug = @project.bugs.build(bug_params)
      @bug.user = current_user
      if @bug.save
        redirect_to user_project_bug_path(@user, @project, @bug)
      else
        render 'new'
      end
    end
  
    def edit
      # The bug is already loaded by the `before_action :find_bug` callback.
    end
  
    def update
      if @bug.update(bug_params)
        redirect_to user_project_bug_path(@user, @project, @bug)
      else
        render 'edit'
      end
    end
  
    def destroy
      @bug.destroy
      redirect_to user_project_bugs_path(@user, @project)
    end
  
    private
  
    def bug_params
      params.require(:bug).permit(:title, :description, :deadline, :bug_type, :bug_status, :image)
    end
  
    def find_user
      @user = User.find(params[:user_id])
    end
  
    def find_project
      @project = @user.projects.find(params[:project_id])
    end
  
    def find_bug
      @bug = @project.bugs.find(params[:id])
    end
  end
  