class Project::ReleasesController < ProjectController
  before_action :set_project_release, only: [:transaction, :print, :accept, :show, :edit, :update, :destroy]
  before_action :set_office_information, only: [:print]
  load_and_authorize_resource except: [:create, :new]
  # GET /project_releases
  # GET /project_releases.json
  def index
    @project_releases = current(Project::Release)
  end

  # GET /project_releases/1
  # GET /project_releases/1.json
  def show
    @project_release_items = @project_release.release_items
  end

  def edit

  end

  def update
   @project_release.update(release_params)
   redirect_to @project_release
  end

  # GET /project_releases/new
  def destroy
    project = @project_release.project
    @project_release.destroy
    respond_to do |format|
      format.html { redirect_to project, notice: 'निकाशा फाराम सफलतापुर्वक मेटाईएको छ ' }
      format.json { head :no_content }
    end
  end

  def accept
    if @project_release.accepted != true
      @project_release.accepted = true
    else
      @project_release.accepted = false
    end
    @project_release.save
    redirect_to @project_release
  end

  def print
    @project_release = Project::Release.find(params[:id])
    @project_release_items = @project_release.release_items
  end

  def transaction
    @items = @project_release.release_items
    @items.each do |item|
      item_transaction = Project::ProjectItemTransaction.new(item.attributes.select{|key, _| Project::ProjectItemTransaction.column_names.include? key})
      item_transaction.transaction_type = -1
      item_transaction.id = nil
      item_transaction.transaction_date = item.release.release_date
      item_transaction.entry_no = item.release.release_no
      item_transaction.release_item_id = item.id
      item_transaction.store_body_id = current_control_body.id
      item_transaction.save!
      item.project_item_transaction_id = item_transaction.id
      item.save!
    end
    @project_release.entry_generated = true
    @project_release.save!
    redirect_to @project_release
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project_release
      @project_release = Project::Release.find(params[:id])
    end

  def release_params
    params.require(:project_release).permit(:office_chief_signed_date, :store_chief_signed_date, :received_by)
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
  end
end
