class ProjectItemsController < ApplicationController
  before_action :set_project_item, only: [:show, :edit, :update, :destroy]

  # GET /project_items
  # GET /project_items.json
  def index
    @project_items = ProjectItem.all
  end

  # GET /project_items/1
  # GET /project_items/1.json
  def show
  end

  # GET /project_items/new
  def new
    @project_item = ProjectItem.new
  end

  # GET /project_items/1/edit
  def edit
  end

  # POST /project_items
  # POST /project_items.json
  def create
    @project_item = ProjectItem.new(project_item_params)
    @item = Item.find(@project_item.item_id)
    @project_item.name_of_item_ne = @item.name_of_item_ne
    @project_item.name_of_item_en = @item.name_of_item_en
    @project_item.unit_ne = @item.unit_ne
    @project_item.unit_en = @item.unit_en
    @project_item.model_no = @item.model_no
    @project_item.item_identification_no = @item.item_identification_no
    @project_item.user_id = current_user.id
    @project_item.project_id = current_project.id
    @project_item.fiscal_year_id = current_fiscal_year.id
    respond_to do |format|
      if @project_item.save
        format.html { redirect_to project_items_path, notice: 'Project item was successfully created.' }
        format.json { render :show, status: :created, location: @project_item }
      else
        format.html { render :new }
        format.json { render json: @project_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_items/1
  # PATCH/PUT /project_items/1.json
  def update
    respond_to do |format|
      if @project_item.update(project_item_params)
        format.html { redirect_to project_items_path, notice: 'Project item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_item }
      else
        format.html { render :edit }
        format.json { render json: @project_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_items/1
  # DELETE /project_items/1.json
  def destroy
    @project_item.destroy
    respond_to do |format|
      format.html { redirect_to project_items_url, notice: 'Project item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_item
      @project_item = ProjectItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_item_params
      params.require(:project_item).permit(:item_id, :item_classification_no)
    end

end
