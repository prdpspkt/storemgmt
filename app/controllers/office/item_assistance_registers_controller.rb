class Office::ItemAssistanceRegistersController < ApplicationController
  before_action :set_item_assistance_register, only: [:show, :edit, :update, :destroy, :print]
  before_action :set_office_information, only: [:print]
  load_and_authorize_resource except: [:create, :new]
  # GET /item_assistance_registers
  # GET /item_assistance_registers.json
  def index
    @item_assistance_registers = Office::ItemAssistanceRegister.all
  end

  # GET /item_assistance_registers/1
  # GET /item_assistance_registers/1.json
  def show
    @item_assistance_register_item = Office::ItemAssistanceRegisterItem.new
    @item_assistance_register_item.item_assistance_register_id = params[:id]
    @item_assistance_register_items = @item_assistance_register.item_assistance_register_items
    @transactions = office(Office::ItemTransaction).where(item_classification_no: 47).where("sku > 0").where("in_use IS NOT true")
  end

  # GET /item_assistance_registers/new
  def new
    @item_assistance_register = Office::ItemAssistanceRegister.new
    @item_assistance_register.register_page_no = new_register_no
  end

  # GET /item_assistance_registers/1/edit
  def edit
  end

  # POST /item_assistance_registers
  # POST /item_assistance_registers.json
  def create
    @item_assistance_register = Office::ItemAssistanceRegister.new(item_assistance_register_params)
    @item_assistance_register.office_id = current_office.id
    @item_assistance_register.user_id = current_user.id
    @item_assistance_register.store_body_id = current_control_body.id
    @item_assistance_register.register_page_no = new_register_no
    respond_to do |format|
      if @item_assistance_register.save
        format.html { redirect_to @item_assistance_register, notice: 'Item assistance register was successfully created.' }
        format.json { render :show, status: :created, location: @item_assistance_register }
      else
        format.html { render :new }
        format.json { render json: @item_assistance_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_assistance_registers/1
  # PATCH/PUT /item_assistance_registers/1.json
  def update
      respond_to do |format|
      if @item_assistance_register.update(item_assistance_register_params)
        @item_assistance_register.save
        format.html { redirect_to @item_assistance_register, notice: 'Item assistance register was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_assistance_register }
      else
        format.html { render :edit }
        format.json { render json: @item_assistance_register.errors, status: :unprocessable_entity }
      end
    end
  end

  def print
    @item_assistance_register_items = @item_assistance_register.item_assistance_register_items
  end

  # DELETE /item_assistance_registers/1
  # DELETE /item_assistance_registers/1.json
  def destroy
    @item_assistance_register.destroy
    respond_to do |format|
      format.html { redirect_to office_item_assistance_registers_url, notice: 'Item assistance register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_assistance_register
      @item_assistance_register = Office::ItemAssistanceRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_assistance_register_params
      params.require(:office_item_assistance_register).permit( :store_chief_signed_date, :office_chief_signed_date, :personnel_id)
    end
    def new_register_no
      liars = office(Office::ItemAssistanceRegister)
      niar = 1
      if liars.count > 0
        niar = liars.last.register_page_no + 1
      end
      niar
    end
  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end
end
