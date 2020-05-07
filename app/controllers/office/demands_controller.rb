class Office::DemandsController < OfficeController
  before_action :set_demand, only: [:show, :edit, :update, :destroy, :accept, :item_assistance_register, :release, :print]
  load_and_authorize_resource except: [:create, :new]
  # GET /demands
  # GET /demands.json
  def index
    @demands = current(Office::Demand).where(classification_no: 407)
    @title = "खर्च भएर जाने जिन्सीको माग फारामहरू"
    @new_url = new_office_demand_url
  end

  def non_expense_index
    @demands = current(Office::Demand).where(classification_no: 408)
    @title = "खर्च नहुने जिन्सीको माग फारामहरू"
    @new_url = non_expense_new_office_demands_url
    render 'index'
  end

  # GET /demands/1
  # GET /demands/1.json
  def show
    @back_url = if @demand.classification_no == 408
                  @title = "खर्च भएर नजाने जिन्सीको"
                  non_expense_index_office_demands_url
                else
                  office_demands_url
                  @title = "खर्च भएर जाने जिन्सीको"
                end
    @demand_item = Office::DemandItem.new
    @items = @demand.demand_items
    @office_items = office(Office::Item).where(item_classification_no: 407)
    @non_expense_transactions = office(Office::ItemTransaction).where(item_classification_no: 408).where("sku > 0")
  end

  # GET /demands/new
  def new
    @demand = Office::Demand.new
    @personnels = office(Office::Personnel).where(working: true)
  end

  def non_expense_new
    @demand = Office::Demand.new
    @personnels = office(Office::Personnel).where(working: true)
  end

  # GET /demands/1/edit
  def edit
    @personnels = office(Office::Personnel).where(working: true)
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Office::Demand.new(demand_params)
    @demand.recommended_by = Office::Personnel.find(demand_params[:recommended_by]).name_ne
    @demand = set_current_information @demand
    @demand.store_body_id = current_control_body.id
    @demand.demand_no = get_new_office_demand_no
    @demand.marked_as_final = false
    @demand.entry_generated = false
    @template = if @demand.classification_no == 407
                  :new
                else
                  :non_expense_new
                end
    respond_to do |format|
      if @demand.save
        format.html { redirect_to @demand, notice: 'Demand was successfully created.' }
        format.json { render :show, status: :created, location: @demand }
      else
        format.html { render @template }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demands/1
  # PATCH/PUT /demands/1.json
  def update
    respond_to do |format|
      if @demand.update(demand_params)
        @demand.recommended_by = Office::Personnel.find(demand_params[:recommended_by]).name_ne
        @demand.save
        format.html { redirect_to @demand, notice: 'Demand was successfully updated.' }
        format.json { render :show, status: :ok, location: @demand }
      else
        format.html { render :edit }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demands/1
  # DELETE /demands/1.json
  def destroy
    @url_to_go = if @demand.classification_no == 407
                   office_demands_url
                 else
                   non_expense_index_office_demands_url
                 end
    @demand.destroy
    respond_to do |format|
      format.html { redirect_to @url_to_go, notice: 'Demand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    @demand.marked_as_final = if @demand.marked_as_final == true
                                false
                              else
                                true
                              end
    @demand.save
    redirect_to office_demand_path(@demand)
  end

  def item_assistance_register
    @person = @demand.personnel
    @item_assistance_register = if @person.item_assistance_register.blank?
                                  create_item_assistance_register @person.id
                                else
                                  @person.item_assistance_register
                                end
    @demand_items = @demand.demand_items
    @demand_items.each do |demand_item|
      transaction = Office::ItemTransaction.find(demand_item.item_transaction_id)
      @item_assistance_register_item = Office::ItemAssistanceRegisterItem.new(demand_item.attributes.select{ |key, _|Office::ItemAssistanceRegisterItem.column_names.include? key})
      @item_assistance_register_item.id = nil
      @item_assistance_register_item.accepted = false
      @item_assistance_register_item.taken_date = @demand.demand_date
      @item_assistance_register_item = set_current_information @item_assistance_register_item
      @item_assistance_register_item.item_assistance_register_id = @item_assistance_register.id
      if @item_assistance_register_item.save
        transaction.in_use = true
      end
    end
    @demand.entry_generated = true
    @demand.save
    redirect_to @demand
  end

  def release
    @release_form = Office::Release.new
    @release_form.received_by = @demand.demand_by
    @release_form.received_date = @demand.demand_date
    @release_form = set_current_information @release_form
    @release_form.store_body_id = current_control_body.id
    @release_form.marked_as_final = false
    @release_form.release_date = bs_today
    @release_form.release_no = new_release_no
    @release_form.demand_id = @demand.id
    @release_form.received_by = @demand.demand_by
    @release_form.received_date = bs_today
    @release_form.entry_generated = false
    ActiveRecord::Base.transaction do
      @release_form.save
      create_release_items @release_form
      @demand.entry_generated = true
      @demand.save
    end
    redirect_to @release_form
  end

  def print
    @office = current_office
    @fiscal_year = @demand.fiscal_year
    @demand_items = @demand.demand_items
    @report_name = "माग फाराम"
    @form_no = 401
    @old_form_no = 51
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'mag_pharam', layout: 'pdf_print'
      end
    end
  end


  private

  def create_item_assistance_register personnel_id
    @item_assistance_register = Office::ItemAssistanceRegister.first_or_create(personnel_id: personnel_id) do |iar|
      iar.office_id = current_office.id
      iar.user_id = current_user.id
      iar.register_page_no = new_item_assistance_register_page_no
    end
  end

  def create_release_items release
    @demand_items = @demand.demand_items
    @demand_items.each do |item|
      item_transactions = office_item_transactions_with_stock item.item_id
      item_transactions.each do |it|
        if it.sku >= item.quantity
          release_item = Office::ReleaseItem.new(item.attributes.select { |key, _| Office::ReleaseItem.column_names.include? key })
          release_item.id = nil
          release_item.release_id = release.id
          release_item = set_current_information release_item
          release_item.quantity = item.quantity
          release_item.rate = it.rate
          release_item.amount = release_item.quantity * release_item.rate
          it.sku = it.sku - item.quantity
          release_item.subed_from = it.id
          release_item.save
          it.save
          break
        else
          release_item = Office::ReleaseItem.new(item.attributes.select { |key, _| Office::ReleaseItem.column_names.include? key })
          release_item.id = nil
          release_item.release_id = release.id
          release_item = set_current_information release_item
          release_item.quantity = it.sku
          release_item.rate = it.rate
          release_item.amount = release_item.quantity * release_item.rate
          item.quantity = item.quantity - it.sku
          release_item.subed_from = it.id
          release_item.save
          it.save
        end
      end

    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_demand
    @demand = Office::Demand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def demand_params
    params.require(:office_demand).permit(:demand_no, :demand_date, :classification_no, :personnel_id, :recommended_by, :recommended_date, :needed_to_purchase, :ordered_date, :recorded_date, :user_id, :fiscal_year, :office_id)
  end

  def get_new_office_demand_no
    demand_no = 1
    @demands = current(Office::Demand)
    if @demands.count > 0
      demand_no = @demands.last.demand_no + 1
    end
    demand_no
  end

  def new_release_no
    nrn = 1
    @releases = current(Office::Release)
    if @releases.count > 0
      nrn = @releases.last.release_no + 1
    end
    nrn
  end

  def new_item_assistance_register_page_no
    nrn = 1
    @item_assistance_register = office(Office::ItemAssistanceRegister)
    if @item_assistance_register.count.positive?
      nrn = @item_assistance_register.last.register_page_no + 1
    end
    nrn
  end

end
