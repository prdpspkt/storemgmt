class Office::PoolItemsController < OfficeController
  before_action :set_office_pool_item, only: [:show, :edit, :update, :destroy, :expense_register]
  load_and_authorize_resource except: [:create, :new]
  # GET /office_items
  # GET /office_items.json
  def index
    @items = office(Office::PoolItem).order("id desc")
  end

  # GET /office_items/1
  # GET /office_items/1.json
  def show
  end

  # GET /office_items/new
  def new
    @item = Office::PoolItem.new
    @categories = office(Office::ItemCategory).order("id DESC")
  end

  # GET /office_items/1/edit
  def edit
  end

  # POST /office_items
  # POST /office_items.json
  def create
    @item = Office::PoolItem.new(office_pool_item_params)
    @item.user_id = current_user.id
    @item.office_id = current_office.id
    @item_category = Office::ItemCategory.find(@item.item_category_id)
    @item.unit_en = @item_category.unit_en
    @item.unit_ne = @item_category.unit_ne
    respond_to do |format|
      if @item.save
        format.html { redirect_to office_pool_items_url, notice: 'Office item was successfully created.' }
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
    respond_to do |format|
      if @item.update(office_pool_item_params)
        format.html { redirect_to office_pool_items_url, notice: 'Office item was successfully updated.' }
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
    if @item.destroy
      redirect_to office_pool_items_url, notice: "सफलता पूर्वक हटाईयो" and return
    else
      flash["error"] = "यो सामाग्रीसंग सम्बन्धित अन्य कारोवार देखिएकोले हटाउन सकिएन"
      redirect_to office_pool_items_url
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
    header = spreadsheet.row(2)
    items = (3..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      item = Office::PoolItem.find_by_id(row["id"]) || Office::PoolItem.new
      begin
        item.attributes = row.to_hash
      rescue Exception => error
        flash[:error] = "तपाईले अपलोड गर्नुभएको फाइलमा पहिचान नभएको कोलम हुन सक्छ त्यसलाई हटाएर पुन अपलोड गर्नुहोस्"
        redirect_to office_items_path and return
      end
      item.office_id = current_office.id
      item.user_id = current_user.id
      item
    end
    items.each do |item|
      if item.valid?
        item.unit_ne = get_category(item.item_category_id).unit_ne
        item.unit_en = get_category(item.item_category_id).unit_en
        item.save!
      else
        flash[:error] = "डाटामा गल्ति हुन सक्छ"
      end
    end
    redirect_to office_pool_items_url
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_office_pool_item
    @item = Office::PoolItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def office_pool_item_params
    params.require(:office_pool_item).permit(:item_classification_no, :name_of_item_ne, :name_of_item_en, :item_category_id)
  end

  def get_category id
    Office::ItemCategory.find(id)
  end
end
