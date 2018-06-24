class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    render json: @projects, status: :ok
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    render json: @project, status: :ok
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
   if @project.save
     #iterate through each of the files
    #  params[:document_data].each do |file|
         @project.documents.create!(:document =>  params[:document_data])
         #create a document associated with the project that has just been created
    #  end
     render json: @project, status: :ok
   else
     render json: @project.errors, status: :unprocessable_entity
   end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      render json: @project, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.permit(:name, :description,:members,:batch,:language, :document_data => []) #add document_data as a permitted parameter
    end
end
