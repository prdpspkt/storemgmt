class ProjectItemEntriesController < ApplicationController
  before_action :set_project_entry, only: [:show, :edit, :update, :destroy]

  # GET /ProjectItemEntries
  # GET /ProjectItemEntries.json
  def index
    @project_item_entries = ProjectItemEntry.all
  end

  # GET /ProjectItemEntries/1
  # GET /ProjectItemEntries/1.json
  def show
  end

  # GET /ProjectItemEntries/new
  def new
    @project_item_entry = ProjectItemEntry.new
  end

  # GET /ProjectItemEntries/1/edit
  def edit
  end

  # POST /ProjectItemEntries
  # POST /ProjectItemEntries.json
  def create
    @project_item_entry = ProjectItemEntry.new(project_entry_params)

    respond_to do |format|
      if @project_item_entry.save
        format.html { redirect_to @project_item_entry, notice: 'Project entry was successfully created.' }
        format.json { render :show, status: :created, location: @project_item_entry }
      else
        format.html { render :new }
        format.json { render json: @project_item_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ProjectItemEntries/1
  # PATCH/PUT /ProjectItemEntries/1.json
  def update
    respond_to do |format|
      if @project_item_entry.update(project_entry_params)
        format.html { redirect_to @project_item_entry, notice: 'Project entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_item_entry }
      else
        format.html { render :edit }
        format.json { render json: @project_item_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ProjectItemEntries/1
  # DELETE /ProjectItemEntries/1.json
  def destroy
    @project_item_entry.destroy
    respond_to do |format|
      format.html { redirect_to officeItemEntries_url, notice: 'Project entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_entry
      @project_item_entry = ProjectItemEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_entry_params
      params.require(:project_item_entry).permit(:item_registration_page_no, :project_item_id, :rate, :quantity, :amount, :user_id, :project_id, :project_id, :fiscal_year_id)
    end
end
