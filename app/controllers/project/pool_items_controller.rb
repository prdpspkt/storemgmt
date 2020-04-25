class Project::PoolItemsController < ApplicationController
  before_action :set_project_pool_item, only: [:show, :edit, :update, :destroy]

  # GET /project/pool_items
  # GET /project/pool_items.json
  def index
    @project_pool_items = Project::PoolItem.all
  end

  # GET /project/pool_items/1
  # GET /project/pool_items/1.json
  def show
  end

  # GET /project/pool_items/new
  def new
    @project_pool_item = Project::PoolItem.new
  end

  # GET /project/pool_items/1/edit
  def edit
  end

  # POST /project/pool_items
  # POST /project/pool_items.json
  def create
    @project_pool_item = Project::PoolItem.new(project_pool_item_params)

    respond_to do |format|
      if @project_pool_item.save
        format.html { redirect_to @project_pool_item, notice: 'Pool item was successfully created.' }
        format.json { render :show, status: :created, location: @project_pool_item }
      else
        format.html { render :new }
        format.json { render json: @project_pool_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project/pool_items/1
  # PATCH/PUT /project/pool_items/1.json
  def update
    respond_to do |format|
      if @project_pool_item.update(project_pool_item_params)
        format.html { redirect_to @project_pool_item, notice: 'Pool item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_pool_item }
      else
        format.html { render :edit }
        format.json { render json: @project_pool_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project/pool_items/1
  # DELETE /project/pool_items/1.json
  def destroy
    @project_pool_item.destroy
    respond_to do |format|
      format.html { redirect_to project_pool_items_url, notice: 'Pool item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_pool_item
      @project_pool_item = Project::PoolItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_pool_item_params
      params.require(:project_pool_item).permit(:name_of_item_ne, :name_of_item_en, :unit_ne, :unit_en, :item_category_id)
    end
end
