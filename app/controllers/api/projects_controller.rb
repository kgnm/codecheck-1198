class Api::ProjectsController < ApplicationController
  before_action :set_project, only: [:show,  :destroy]

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

  # GET /projects/new
  

  # GET /projects/1/edit
  

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(:title => project_params[:title],:description => project_params[:description])

    #respond_to do |format|
      if @project.save
	    render json: @project, status: :ok, location: @project
        #format.html { redirect_to @project, notice: 'Project was successfully created.' }
        #format.json { render :show, status: :ok, location: @project }
      else
        head :bad_request
		#format.html { render :new }
        #format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
 

  # DELETE /projects/
  # DELETE /projects/
  def destroy
    @project.destroy
    render json: @project, status: :ok, location: @project
  rescue  
    head :not_found
 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
			params.require(:title)
			params.require(:description)
			params.permit(:url)
			params
	  # params.require(:project).permit(:url, :title, :description, :created_at)
    end
end
