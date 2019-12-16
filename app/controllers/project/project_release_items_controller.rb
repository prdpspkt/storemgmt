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
    project_item_id = params[:project_release_item][:project_item_id]
    quantity = (params[:project_release_item][:quantity]).to_d
    @incomes = Oeirt.where(project_item_id: project_item_id)
                   .where(transaction_type: 1)
                   .where("sku > 0")
    @incomes.each do |item|
      if item.sku >= quantity
        project_release_item = ProjectReleaseItem.new(project_release_item_params)
        project_release_item.item_classification_no = 52
        project_release_item.project_id = current_project.id
        project_release_item.quantity = quantity
        project_release_item.rate = item.rate
        project_release_item.amount = quantity * item.rate
        project_release_item = create_project_release_item(project_release_item)
        project_release_item.released_from = item.id
        if project_release_item.save
          item.sku = item.sku - quantity
          item.save
          quantity = 0
          break;
        end
      end

      if (item.sku < quantity && item.sku > 0)
        project_release_item = ProjectReleaseItem.new(project_release_item_params)
        project_release_item.quantity = item.sku
        project_release_item.rate = item.rate
        project_release_item.released_from = item.id
        project_release_item.item_classification_no = 52
        project_release_item.project_id = current_project.id
        project_release_item.amount = item.sku * item.rate
        project_release_item = create_project_release_item(project_release_item)
        if project_release_item.save
          quantity = quantity - item.sku
          item.sku = 0
          item.save
        end
      end
    end

    @rf = ProjectRelease.find(params[:project_release_item][:project_release_id])
    respond_to do |format|
      format.html { redirect_to @rf, notice: 'Project release item was successfully created.' }
      format.json { render :show, status: :created, location: @project_release_item }
    end
  end

  # PATCH/PUT /project_release_items/1
  # PATCH/PUT /project_release_items/1.json
  def update
    @item = ProjectItem.find(@project_release_item.project_item_id)
    @project_release_item.item_id = @item.item_id
    @project_release_item.project_item_id = @item.id
    @project_release_item.name_of_item_ne = @item.name_of_item_ne
    @project_release_item.name_of_item_en = @item.name_of_item_en
    @project_release_item.item_register_page_no = @item.item_register_page_no
    @project_release_item.unit_ne = @item.unit_ne
    @project_release_item.unit_en = @item.unit_ne
    @rf = ProjectRelease.find(@project_release_item.project_release_id)

    respond_to do |format|
      if @project_release_item.update(project_release_item_params)
        format.html { redirect_to @rf, notice: 'Project release item was successfully updated.' }
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
    @id = @project_release_item.id
    @project_release_item.destroy
    respond_to do |format|
      format.html { redirect_to project_release_items_url, notice: 'Project release item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_release_item
    @project_release_item = ProjectReleaseItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_release_item_params
    params.require(:project_release_item).permit(:project_item_id, :quantity, :remarks, :project_release_id)
  end

  def create_project_release_item ori
    @item = ProjectItem.find(ori.project_item_id)
    ori.item_id = @item.item_id
    ori.project_item_id = @item.id
    ori.name_of_item_ne = @item.name_of_item_ne
    ori.name_of_item_en = @item.name_of_item_en
    ori.item_register_page_no = @item.item_register_page_no
    ori.unit_ne = @item.unit_ne
    ori.unit_en = @item.unit_ne
    ori.fiscal_year_id = current_fiscal_year.id
    ori.user_id = current_user.id
    ori.project_id = current_project.id
    ori
  end
end


