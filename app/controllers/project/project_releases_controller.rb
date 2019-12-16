class ProjectReleasesController < ApplicationController
  before_action :set_project_release, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /project_releases
  # GET /project_releases.json
  def index
    @project_releases = ProjectRelease.all
  end

  # GET /project_releases/1
  # GET /project_releases/1.json
  def show
    @project_release_items = @project_release.project_release_items
    @project_release_item = ProjectReleaseItem.new
  end

  # GET /project_releases/new
  def new
    @project_release = ProjectRelease.new
    @project_release.release_no = new_release_no
  end

  # GET /project_releases/1/edit
  def edit
  end

  # POST /project_releases
  # POST /project_releases.json
  def create
    @project_release = ProjectRelease.new(project_release_params)
    @project_release.store_chief_name = current_store_keeper.name_ne
    @project_release.project_chief_name = current_project_chief.name_ne
    @project_release.user_id = current_user.id
    @project_release.project_id = current_project.id
    @project_release.fiscal_year_id = current_fiscal_year.id
    @project_release.fy = current_fiscal_year.fy
    @project_release.marked_as_final = false
    @project_release.release_no = new_release_no

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

  def mark_as_final
    if (can_unmark(@project_release))
      @project_release.marked_as_final = false
      @project_release.save
    else
      @project_release.marked_as_final = true
      @project_release.save
    end
    redirect_to @project_release
  end

  private

  def can_unmark obj
    (obj.marked_as_final == true) && (DateTime.now < 3.days.after(obj.updated_at))
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_project_release
      @project_release = ProjectRelease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_release_params
      params.require(:project_release).permit(:release_no, :release_date, :store_chief_signed_date,  :project_chief_signed_date)
    end

  def new_release_no
    lor = ProjectRelease.last
    @lorn = false
    if (!lor.blank? && lor.release_no.present?)
      @lorn = lor.release_no + 1
    else
      @lorn = 1
    end
    @lorn
  end
end
