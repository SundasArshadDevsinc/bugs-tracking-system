class ProjectsController < ApplicationController
        before_action :find_user, only: [:index, :new, :create, :edit]
        before_action :find_project, only: [:show, :edit, :update, :destroy]
      
        def index
          if current_user.role == 'developer'
            # Fetch bugs for which the current user is assigned as a developer
            developer_bugs = Bug.where(developer_id: current_user.id)
      
            # Extract the associated projects from the developer's bugs
            @projects = developer_bugs.map { |bug| bug.project }.uniq
          elsif current_user.role == 'qa'
            @projects = Project.all
          else
            @projects = current_user.projects
          end
        end
      
        def show
          # Assuming you have a user association on the Project model
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
            redirect_to user_project_path(@user, @project) # Adjust the route name as needed
          else
            render 'new'
          end
        end
      
        def edit
          # The project is already loaded by the `before_action :find_project` callback.
        end
      
        def update
          authorize @project
          if @project.update(project_params)
            redirect_to user_project_path(@project.user, @project) # Use @project.user to get the associated user
          else
            render 'edit'
          end
        
        end
    
          def destroy
            authorize @project
            @project.destroy
            redirect_to user_projects_path(@project.user) # Use @project.user to get the associated user
          end
        
      
        private
      
        def project_params
          params.require(:project).permit(:title, :description, :technologies)
        end
      
        def find_user
          @user = current_user
        end
      
        def find_project
          @project = Project.find(params[:id])
        end
      end
      
