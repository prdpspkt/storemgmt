class ProjectReleasesController < ApplicationController
  before_action :set_project_release, only: [:show, :edit, :update, :destroy]

  # GET /project_releases
  # GET /project_releases.json
  def index
    @project_releases = ProjectRelease.all
  end

  # GET /project_releases/1
  # GET /project_releases/1.json
  def show
  end

  # GET /project_releases/new
  def new
    @project_release = ProjectRelease.new
  end

  # GET /project_releases/1/edit
  def edit
  end

  # POST /project_releases
  # POST /project_releases.json
  def create
    @project_release = ProjectRelease.new(project_release_params)

    respond_to do |format|
      if @project_release.save
        format.html { redirect_to @project_release, notice: 'Project release was successfully created.' }
        format.json { render :show, status: :created, location: @project_release }
      else
        format.html { render :new }
        format.json { render json: @project_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_releases/1
  # PATCH/PUT /project_releases/1.json
  def update
    respond_to do |format|
      if @project_release.update(project_release_params)
        format.html { redirect_to @project_release, notice: 'Project release was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_release }
      else
        format.html { render :edit }
        format.json { render json: @project_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_releases/1
  # DELETE /project_releases/1.json
  def destroy
    @project_release.destroy
    respond_to do |format|
      format.html { redirect_to project_releases_url, notice: 'Project release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_release
      @project_release = ProjectRelease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_release_params
      params.require(:project_release).permit(:fy, :release_no, :release_date, :store_chief_name, :store_chief_signed_date, :office_chief_name, :office_chief_signed_date, :user_id, :office_id, :project_id, :fiscal_year_id, :marked_as_final)
    end
end
