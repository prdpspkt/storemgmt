class PneirtsController < ApplicationController
  before_action :set_pneirt, only: [:show, :edit, :update, :destroy]

  # GET /pneirts
  # GET /pneirts.json
  def index
    @pneirts = Pneirt.all
  end

  # GET /pneirts/1
  # GET /pneirts/1.json
  def show
  end

  # GET /pneirts/new
  def new
    @pneirt = Pneirt.new
  end

  # GET /pneirts/1/edit
  def edit
  end

  # POST /pneirts
  # POST /pneirts.json
  def create
    @pneirt = Pneirt.new(pneirt_params)

    respond_to do |format|
      if @pneirt.save
        format.html { redirect_to @pneirt, notice: 'Pneirt was successfully created.' }
        format.json { render :show, status: :created, location: @pneirt }
      else
        format.html { render :new }
        format.json { render json: @pneirt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pneirts/1
  # PATCH/PUT /pneirts/1.json
  def update
    respond_to do |format|
      if @pneirt.update(pneirt_params)
        format.html { redirect_to @pneirt, notice: 'Pneirt was successfully updated.' }
        format.json { render :show, status: :ok, location: @pneirt }
      else
        format.html { render :edit }
        format.json { render json: @pneirt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pneirts/1
  # DELETE /pneirts/1.json
  def destroy
    @pneirt.destroy
    respond_to do |format|
      format.html { redirect_to pneirts_url, notice: 'Pneirt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pneirt
      @pneirt = Pneirt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pneirt_params
      params.require(:pneirt).permit(:model_no, :item_identificaiton_no, :country, :project_item_id, :item_id, :office_id, :user_id, :fiscal_year_id, :transaction_date, :transaction_type, :rate, :amount, :quantity, :project_purchase_entry_item_id, :breakdown_id, :remarks, :sku, :project_handover_form_id, :entry_no, :country, :size, :approx_age, :source)
    end
end
