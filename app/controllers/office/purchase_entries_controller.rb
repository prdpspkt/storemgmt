class Office::PurchaseEntriesController < ApplicationController
  before_action :set_office_entry, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /OfficePurchaseEntries
  # GET /OfficePurchaseEntries.json
  def index
    @purchase_entries = current(Office::PurchaseEntry)
    end


  # GET /OfficePurchaseEntries/1
  # GET /OfficePurchaseEntries/1.json
  def show
    @purchase_entry_item = Office::PurchaseEntryItem.new
    @purchase_entry_items = @purchase_entry.purchase_entry_items

  end

  # GET /OfficePurchaseEntries/new
  def new
    @purchase_entry = Office::PurchaseEntry.new
    @purchase_entry.entry_no = new_entry_no
  end

  # GET /OfficePurchaseEntries/1/edit
  def edit
  end

  # POST /OfficePurchaseEntries
  # POST /OfficePurchaseEntries.json
  def create
    @purchase_entry = Office::PurchaseEntry.new(office_entry_params)
    @purchase_entry.fiscal_year_id = current_fiscal_year.id
    @purchase_entry.user_id = current_user.id
    @purchase_entry.office_id = current_office.id
    @purchase_entry.fy = current_fiscal_year.fy
    @purchase_entry.entry_no = new_entry_no
   @purchase_entry.store_body_id = current_control_body.id
    @purchase_entry.marked_as_final = false
    respond_to do |format|
      if @purchase_entry.save
        format.html { redirect_to @purchase_entry, notice: 'Office entry was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_entry }
      else
        format.html { render :new }
        format.json { render json: @purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /OfficePurchaseEntries/1
  # PATCH/PUT /OfficePurchaseEntries/1.json
  def update
    respond_to do |format|
      if @purchase_entry.update(office_entry_params)
        format.html { redirect_to @purchase_entry, notice: 'Office entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_entry }
      else
        format.html { render :edit }
        format.json { render json: @purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /OfficePurchaseEntries/1
  # DELETE /OfficePurchaseEntries/1.json
  def destroy
    @purchase_entry.destroy
    respond_to do |format|
      format.html { redirect_to office_purchase_entries_url, notice: 'Office entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_final
    if (can_unmark(@purchase_entry))
      @purchase_entry.marked_as_final = false
      @purchase_entry.save
    else
      @purchase_entry.marked_as_final = true
      @purchase_entry.save
    end
    redirect_to @purchase_entry
  end

  private
  def can_unmark obj
    (obj.marked_as_final == true) && (DateTime.now < 3.days.after(obj.updated_at))
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_office_entry
      @purchase_entry = Office::PurchaseEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_entry_params
      params.require(:office_purchase_entry).permit(:purchase_handover_no, :entry_date, :entry_no, :store_chief_signed_date,  :section_chief_signed_date, :office_chief_signed_date)
    end

  def new_entry_no
    ope = current(Office::PurchaseEntry)
    nopen = 1
    if ope.count > 0
      nopen = loe.entry_no + 1
    end
    nopen
  end
end
