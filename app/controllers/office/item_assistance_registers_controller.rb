class Office::ItemAssistanceRegistersController < ApplicationController
  before_action :set_item_assistance_register, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /item_assistance_registers
  # GET /item_assistance_registers.json
  def index
    @item_assistance_registers = ItemAssistanceRegister.all
  end

  # GET /item_assistance_registers/1
  # GET /item_assistance_registers/1.json
  def show
    @item_assistance_register_item = ItemAssistanceRegisterItem.new
    @item_assistance_register_item.item_assistance_register_id = params[:id]
    @item_assistance_register_items = @item_assistance_register.item_assistance_register_items
  end

  # GET /item_assistance_registers/new
  def new
    @item_assistance_register = ItemAssistanceRegister.new
    @item_assistance_register.register_page_no = new_register_no
  end

  # GET /item_assistance_registers/1/edit
  def edit
  end

  # POST /item_assistance_registers
  # POST /item_assistance_registers.json
  def create
    @item_assistance_register = ItemAssistanceRegister.new(item_assistance_register_params)
    @item = OfficeItem.find(@item_assistance_register.office_item_id)
    @item_assistance_register.item_register_page_no = @item.item_register_page_no
    @item_assistance_register.name_of_item_ne = @item.name_of_item_ne
    @item_assistance_register.name_of_item_en = @item.name_of_item_en
    @item_assistance_register.register_page_no = new_register_no
    @item_assistance_register.unit_en = @item.unit_en
    @item_assistance_register.unit_ne = @item.unit_ne
    @item_assistance_register.fy = current_fiscal_year.fy
    @item_assistance_register.fiscal_year_id = current_fiscal_year.id
    @item_assistance_register.user_id = current_user.id
    @item_assistance_register.office_id = current_office.id
    @item_assistance_register.store_chief_name = current_store_keeper.name_ne
    @item_assistance_register.store_chief_designation = current_store_keeper.post
    @item_assistance_register.office_chief_name = current_office_chief.name_ne
    @item_assistance_register.office_chief_designation = current_office_chief.post

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
        @item = OfficeItem.find(@item_assistance_register.office_item_id)
        @item_assistance_register.item_register_page_no = @item.item_register_page_no
        @item_assistance_register.name_of_item_ne = @item.name_of_item_ne
        @item_assistance_register.name_of_item_en = @item.name_of_item_en
        @item_assistance_register.register_page_no = new_register_no
        @item_assistance_register.unit_en = @item.unit_en
        @item_assistance_register.unit_ne = @item.unit_ne
        @item_assistance_register.save
        format.html { redirect_to @item_assistance_register, notice: 'Item assistance register was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_assistance_register }
      else
        format.html { render :edit }
        format.json { render json: @item_assistance_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_assistance_registers/1
  # DELETE /item_assistance_registers/1.json
  def destroy
    @item_assistance_register.destroy
    respond_to do |format|
      format.html { redirect_to item_assistance_registers_url, notice: 'Item assistance register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_assistance_register
      @item_assistance_register = ItemAssistanceRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_assistance_register_params
      params.require(:item_assistance_register).permit( :store_chief_signed_date, :office_chief_signed_date, :office_item_id)
    end
    def new_register_no
      liar = ItemAssistanceRegister.last
      if (!liar.blank? && liar.register_page_no.present?)
        niar = liar.register_page_no + 1
      else
        niar = 1
      end
      niar
    end
end
