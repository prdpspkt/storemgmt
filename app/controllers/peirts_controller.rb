class PeirtsController < ApplicationController
  before_action :set_peirt, only: [:show, :edit, :update, :destroy]

  # GET /peirts
  # GET /peirts.json
  def index
    @peirts = Peirt.all
  end

  # GET /peirts/1
  # GET /peirts/1.json
  def show
  end

  # GET /peirts/new
  def new
    @peirt = Peirt.new
  end

  # GET /peirts/1/edit
  def edit
  end

  # POST /peirts
  # POST /peirts.json
  def create
    @peirt = Peirt.new(peirt_params)

    respond_to do |format|
      if @peirt.save
        format.html { redirect_to @peirt, notice: 'Peirt was successfully created.' }
        format.json { render :show, status: :created, location: @peirt }
      else
        format.html { render :new }
        format.json { render json: @peirt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peirts/1
  # PATCH/PUT /peirts/1.json
  def update
    respond_to do |format|
      if @peirt.update(peirt_params)
        format.html { redirect_to @peirt, notice: 'Peirt was successfully updated.' }
        format.json { render :show, status: :ok, location: @peirt }
      else
        format.html { render :edit }
        format.json { render json: @peirt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peirts/1
  # DELETE /peirts/1.json
  def destroy
    @peirt.destroy
    respond_to do |format|
      format.html { redirect_to peirts_url, notice: 'Peirt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peirt
      @peirt = Peirt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peirt_params
      params.require(:peirt).permit(:project_item_id, :item_id, :office_id, :project_id, :fiscal_year_id, :user_id, :transaction_date, :transaction_type, :rate, :amount, :quantity, :remarks, :office_purchase_entry_item_id, :sku, :project_release_item_id, :entry_no)
    end
end
