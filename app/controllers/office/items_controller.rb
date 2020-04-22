class Office::ItemsController < OfficeController
  before_action :set_office_item, only: [:show, :edit, :update, :destroy, :expense_register]
  load_and_authorize_resource except: [:create, :new]
  # GET /office_items
  # GET /office_items.json
  def expense_index
    @items = current(Office::Item).where(item_classification_no: 52)
    respond_to do |format|
      format.html
      format.json
      format.xlsx
    end
  end

  def non_expense_index
    @items = office(Office::Item).where(item_classification_no: 47)
    respond_to do |format|
      format.html
      format.json
      format.xlsx
    end
  end

  # GET /office_items/1
  # GET /office_items/1.json
  def show
  end

  # GET /office_items/new
  def new
    @item = Office::Item.new
  end

  # GET /office_items/1/edit
  def edit
  end

  # POST /office_items
  # POST /office_items.json
  def create
    @item = Office::Item.new(office_item_params)
    @item.user_id = current_user.id
    @item.office_id = current_office.id
    @item_category = Office::ItemCategory.find(@item.item_category_id)
    @item.unit_en = @item_category.unit_en
    @item.unit_ne = @item_category.unit_ne
    @item.item_register_page_no = new_item_register_page_no @item.item_classification_no
    if @item.item_classification_no == 52
      url_to_go = expense_index_office_items_url
    else
      url_to_go = non_expense_index_office_items_url
    end 
    respond_to do |format|
      if @item.save
        format.html { redirect_to url_to_go, notice: 'Office item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_items/1
  # PATCH/PUT /office_items/1.json
  def update
    if @item.item_classification_no == 52
      url_to_go = expense_index_office_items_url
    else
      url_to_go = non_expense_index_office_items_url
    end 
    respond_to do |format|
      if @item.update(office_item_params)
        format.html { redirect_to url_to_go, notice: 'Office item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_items/1
  # DELETE /office_items/1.json
  def destroy
    url_to_go = request.referer || root_path
    @item.destroy
    respond_to do |format|
      if Office::Item.exists?(@item.id)
        flash[:error] = @item.errors[:base][0].to_s
        format.html { redirect_to url_to_go }
        format.json { head :no_content }
      else
        format.html { redirect_to url_to_go office_item_categories_url, notice: "Successfully deleted." }
        format.json { head :no_content }
      end
    end
  end

  def import
    file = params[:file]
    spreadsheet = case File.extname(file.original_filename)
                  when ".csv" then
                    Csv.new(file.path, nil, :ignore)
                  when ".xls" then
                    Roo::Excel.new(file.path, nil, :ignore)
                  when ".xlsx" then
                    Roo::Excelx.new(file.path)
                  else
                    flash[:error] = " अपलोड गरिएको फाइल <b> #{file.original_filename} </b> को पहिचान हुन सकेन |"
                    redirect_to office_items_path and return
                  end
    header = spreadsheet.row(1)
    items = (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      item = Office::Item.find_by_id(row["id"]) || Office::Item.new
      begin
        item.attributes = row.to_hash
      rescue Exception => error
        flash[:error] = "तपाईले अपलोड गर्नुभएको फाइलमा पहिचान नभएको कोलम हुन सक्छ त्यसलाई हटाएर पुन अपलोड गर्नुहोस्"
        redirect_to office_items_path and return
      end
      item.office_id = current_office.id
      item.user_id = current_user.id
      if item.item_register_page_no.present? == false
        item.item_register_page_no = new_item_register_page_no item.item_classification_no
      end
      item
    end
    if items.map(&:valid?).all?
      items.each(&:save!)
      true
    else
      items.each_with_index do |item, index|
        item.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 6}: #{msg}"
        end
      end
      false
    end
    redirect_to office_items_path
  end


  def item_register
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
    if @item.item_classification_no == 47
      render 'non_expense_register' and return
    else
      render 'expense_register' and return
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_office_item
    @item = Office::Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def office_item_params
    params.require(:office_item).permit(:specification, :item_classification_no, :name_of_item_ne, :name_of_item_en, :item_category_id)
  end

  def new_item_register_page_no item_classification_no
    item_register_page_no = 1
    items = office(Office::Item).where(item_classification_no: item_classification_no)
    if items.count > 0
      item_register_page_no = items.last.item_register_page_no + 1
    end
    item_register_page_no
  end

end
