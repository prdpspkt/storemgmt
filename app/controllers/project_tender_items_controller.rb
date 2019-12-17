class ProjectTenderItemsController < ApplicationController
  before_action :set_project_tender_item, only: [:show, :edit, :update, :destroy]

  # GET /project_tender_items
  # GET /project_tender_items.json
  def index
    @project_tender_items = ProjectTenderItem.all
  end

  # GET /project_tender_items/1
  # GET /project_tender_items/1.json
  def show
  end

  # GET /project_tender_items/new
  def new
    @project_tender_item = ProjectTenderItem.new
  end

  # GET /project_tender_items/1/edit
  def edit
  end

  # POST /project_tender_items
  # POST /project_tender_items.json
  def create
    @project_tender_item = ProjectTenderItem.new(project_tender_item_params)

    respond_to do |format|
      if @project_tender_item.save
        format.html { redirect_to @project_tender_item, notice: 'Project tender item was successfully created.' }
        format.json { render :show, status: :created, location: @project_tender_item }
      else
        format.html { render :new }
        format.json { render json: @project_tender_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_tender_items/1
  # PATCH/PUT /project_tender_items/1.json
  def update
    respond_to do |format|
      if @project_tender_item.update(project_tender_item_params)
        format.html { redirect_to @project_tender_item, notice: 'Project tender item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_tender_item }
      else
        format.html { render :edit }
        format.json { render json: @project_tender_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_tender_items/1
  # DELETE /project_tender_items/1.json
  def destroy
    @project_tender_item.destroy
    respond_to do |format|
      format.html { redirect_to project_tender_items_url, notice: 'Project tender item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_tender_item
      @project_tender_item = ProjectTenderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_tender_item_params
      params.require(:project_tender_item).permit(:name_of_item_ne, :name_of_item_en, :unit_ne, :unit_en, :quantity, :rate, :amount, :office_id, :user_id, :received_date, :project_purchase_tender_id, :fy, :fiscal_year_id)
    end
end
