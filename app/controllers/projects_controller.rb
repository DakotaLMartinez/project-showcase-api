class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ update destroy ]
  before_action :authenticate_user!, only: %i[ create update destroy ]

  # GET /projects
  def index
    @projects = Project.all

    data = @projects.map do |project|
      ProjectSerializer.new(project).serializable_hash[:data][:attributes]
    end

    render json: data
  end

  # GET /projects/1
  def show
    render json: ProjectSerializer.new(Project.find(params[:id])).serializable_hash[:data][:attributes]
  end

  # POST /projects
  def create
    @project = current_user.projects.create!(project_params)
    render json: ProjectSerializer.new(@project).serializable_hash[:data][:attributes], status: :created    
  end

  # PATCH/PUT /projects/1
  def update
    @project.update!(project_params)
    render json: ProjectSerializer.new(@project).serializable_hash[:data][:attributes], status: :ok
  end

  # DELETE /projects/1
  def destroy
    @project.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.permit(:featured_image, :name, :about, :live_demo_url, :code_url, :video_url, technologies: [], collaborators: [])
    end
end
