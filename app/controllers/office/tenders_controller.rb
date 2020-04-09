class Office::TendersController < OfficeController
  before_action :set_tender, only: [:show, :edit, :update, :destroy, :accept, :entry, :print]
  before_action :set_office_information

  # GET /tenders
  # GET /tenders.json
  def index
    @tenders = current(Office::Tender)
  end

  # GET /tenders/1
  # GET /tenders/1.json
  def show
    @tender_item = Office::TenderItem.new
    @tender_items = @tender.tender_items
  end

  # GET /tenders/new
  def new
    @tender = Office::Tender.new
  end

  # GET /tenders/1/edit
  def edit
  end

  # POST /tenders
  # POST /tenders.json
  def create
    @tender = Office::Tender.new(tender_params)
    @tender = update_general_information @tender
    respond_to do |format|
      if @tender.save
        format.html { redirect_to @tender, notice: 'Office purchase tender was successfully created.' }
        format.json { render :show, status: :created, location: @tender }
      else
        format.html { render :new }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenders/1
  # PATCH/PUT /tenders/1.json
  def update
    respond_to do |format|
      if @tender.update(tender_params)
        format.html { redirect_to @tender, notice: 'Office purchase tender was successfully updated.' }
        format.json { render :show, status: :ok, location: @tender }
      else
        format.html { render :edit }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    if @tender.marked_as_final == true
      @tender.marked_as_final = false
    else
      @tender.marked_as_final = true
    end
    @tender.save!
    redirect_to @tender
  end

  def entry
    create_purchase_entry
    @tender.tender_items.each do |tender_item|
      purchase_entry_item = Office::PurchaseEntryItem.new(tender_item.attributes.select { |key, _| Office::PurchaseEntryItem.column_names.include? key })
      purchase_entry_item.id = nil
      purchase_entry_item.purchase_entry_id = @purchase_entry.id
      purchase_entry_item.save
    end
    redirect_to @purchase_entry
  end

  def print
    @office = @tender.office
    @fiscal_year = @tender.fiscal_year
    @report_name = "ठेक्का विवरण"
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "tender_report", layout: "pdf_print"
      end
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy
    @tender.destroy
    respond_to do |format|
      format.html { redirect_to office_tenders_url, notice: 'Office purchase tender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tender
    @tender = Office::Tender.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tender_params
    params.require(:office_tender).permit(:tender_no, :tender_name, :tender_date, :marked_as_final, :bidders_name, :bidders_address)
  end

  def update_general_information object
    object = set_current_information object
    object.store_body_id = current_control_body.id
    object
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end

  def create_purchase_entry
    @purchase_entry = Office::PurchaseEntry.new
    @purchase_entry = set_current_information @purchase_entry
    @purchase_entry.entry_no = new_entry_no
    @purchase_entry.entry_date = bs_today
    @purchase_entry.store_body_id = current_control_body.id
    @purchase_entry.store_chief_signed_date = bs_today
    @purchase_entry.section_chief_signed_date = bs_today
    @purchase_entry.office_chief_signed_date = bs_today
    @purchase_entry.generated_from = "tender"
    @purchase_entry.tender_id = @tender.id
    @purchase_entry.save!
    @tender.entry_generated = true
    @tender.save!
  end

  def new_entry_no
    ope = current(Office::PurchaseEntry)
    nopen = 1
    if ope.count > 0
      nopen = ope.last.entry_no + 1
    end
    nopen
  end

end
