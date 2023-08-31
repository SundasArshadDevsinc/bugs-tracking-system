class BugsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    before_action :find_user   
    before_action :find_project 
    before_action :find_bug, only: [:show, :edit, :update, :destroy]
  
    def index
      @bugs = @project.bugs
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
      @bug.destroy
      redirect_to user_project_path(@user, @project)
    end
  
    private
  
    def bug_params
      params.require(:bug).permit(:title, :description, :deadline, :types, :status, :developer_id, :image)
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

    def update_bug_status
      if current_user.developer? # Ensure only developers can update bug_status
        if @bug.update(bug_status: params[:bug][:bug_status])
          redirect_to user_project_bug_path(@user, @project, @bug), notice: 'Bug Status was successfully updated.'
        else
          render 'show'
        end
      else
        redirect_to user_project_bug_path(@user, @project, @bug), alert: 'You do not have permission to update Bug Status.'
      end
    end
    
  end
  