class ProjectItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @project_items = office(ProjectItem)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @project_item = ProjectItem.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @project_item = ProjectItem.new(item_params)
    @project_item.office_id = current_office.id
    @project_item.user_id = current_user.id
    @project_item_category = ProjectItemCategory.find(@project_item.project_item_category_id)
    @project_item.unit_ne = @project_item_category.unit_ne
    @project_item.unit_en = @project_item_category.unit_en
    @project_item.item_register_page_no = new_item_register_page_no
    respond_to do |format|
      if @project_item.save
        format.html { redirect_to project_items_path, notice: 'ProjectItem was successfully created.' }
        format.json { render :show, status: :created, location: @project_item }
      else
        format.html { render :new }
        format.json { render json: @project_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @project_item.update(item_params)
        format.html { redirect_to project_items_path, notice: 'ProjectItem was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_item }
      else
        format.html { render :edit }
        format.json { render json: @project_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @project_item.destroy
    respond_to do |format|
      format.html { redirect_to project_items_url, notice: 'ProjectItem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @project_item = ProjectItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:project_item).permit(:name_of_item_ne, :specification, :name_of_item_en, :project_item_category_id)
  end

  def new_item_register_page_no
    project_items = current(ProjectItem)
    irpn = 1
    if project_items.count > 0
      irpn = project_items.last.item_register_page_no + 1
    end
    irpn
  end
end
