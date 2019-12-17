class ProjectReleaseItemsController < ApplicationController
  before_action :set_project_release_item, only: [:show, :edit, :update, :destroy]

  # GET /project_release_items
  # GET /project_release_items.json
  def index
    @project_release_items = ProjectReleaseItem.all
  end

  # GET /project_release_items/1
  # GET /project_release_items/1.json
  def show
  end

  # GET /project_release_items/new
  def new
    @project_release_item = ProjectReleaseItem.new
  end

  # GET /project_release_items/1/edit
  def edit
  end

  # POST /project_release_items
  # POST /project_release_items.json
  def create
    @project_release_item = ProjectReleaseItem.new(project_release_item_params)

    respond_to do |format|
      if @project_release_item.save
        format.html { redirect_to @project_release_item, notice: 'Project release item was successfully created.' }
        format.json { render :show, status: :created, location: @project_release_item }
      else
        format.html { render :new }
        format.json { render json: @project_release_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_release_items/1
  # PATCH/PUT /project_release_items/1.json
  def update
    respond_to do |format|
      if @project_release_item.update(project_release_item_params)
        format.html { redirect_to @project_release_item, notice: 'Project release item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_release_item }
      else
        format.html { render :edit }
        format.json { render json: @project_release_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_release_items/1
  # DELETE /project_release_items/1.json
  def destroy
    @project_release_item.destroy
    respond_to do |format|
      format.html { redirect_to project_release_items_url, notice: 'Project release item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_release_item
      @project_release_item = ProjectReleaseItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_release_item_params
      params.require(:project_release_item).permit(:name_of_item_ne, :name_of_item_en, :item_register_page_no, :code_no, :specificaiton, :unit_en, :unit_ne, :quantity, :rate, :amount, :remarks, :project_item_id, :project_release_id, :user_id, :office_id, :item_id, :fiscal_year_id, :release_from, :item_classification_no)
    end
end
