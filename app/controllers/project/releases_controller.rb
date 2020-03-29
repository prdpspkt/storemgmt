class Project::ReleasesController < ProjectController
  before_action :set_project_release, only: [:generate_ledger_entry, :mark_as_final, :show, :edit, :update, :destroy]
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

  def mark_as_final
    if @project_release.marked_as_final == true
      @project_release.marked_as_final = false
      @project_release.save
    else
      @project_release.marked_as_final = true
      @project_release.save
    end
    redirect_to @project_release
  end

  def generate_ledger_entry
    @items = @project_release.release_items
    @items.each do |item|
      item_transaction = Project::ItemTransaction.new(item.attributes.select{|key, _| Project::ItemTransaction.column_names.include? key})
      item_transaction.transaction_type = -1
      item_transaction.id = nil
      item_transaction.transaction_date = item.release.release_date
      item_transaction.entry_no = item.release.release_no
      item_transaction.release_item_id = item.id
      item_transaction.save
      @project_release.entry_generated = true
      @project_release.save
      item.item_transaction_id = item_transaction.id
      item.save
      redirect_to @project_release
    end

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project_release
      @project_release = Project::Release.find(params[:id])
    end
end
