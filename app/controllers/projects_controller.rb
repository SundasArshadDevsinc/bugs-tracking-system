class ProjectsController < ApplicationController
        before_action :find_user, only: [:index, :new, :create, :edit]
        before_action :find_project, only: [:show, :edit, :update, :destroy]
      
        def index
          @projects = @user.projects
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
          if @project.update(project_params)
            redirect_to user_project_path(@user, @project) # Adjust the route name as needed
          else
            render 'edit'
          end
        end
      
        def destroy
          @project.destroy
          redirect_to user_projects_path(@user) # Adjust the route name as needed
        end
      
        private
      
        def project_params
          params.require(:project).permit(:title, :description, :technologies)
        end
      
        def find_user
          @user = User.find(params[:user_id])
        end
      
        def find_project
          @project = Project.find(params[:id])
        end
      end
      
