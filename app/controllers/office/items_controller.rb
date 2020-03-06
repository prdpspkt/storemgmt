class Office::ItemsController < ApplicationController
  before_action :set_office_item, only: [:show, :edit, :update, :destroy]

  # GET /office_items
  # GET /office_items.json
  def index
    @office_items = office(Office::Item)
  end

  # GET /office_items/1
  # GET /office_items/1.json
  def show
  end

  # GET /office_items/new
  def new
    @office_item = Office::Item.new
  end

  # GET /office_items/1/edit
  def edit
  end

  # POST /office_items
  # POST /office_items.json
  def create
    @office_item = Office::Item.new(office_item_params)
    @office_item.user_id = current_user.id
    @office_item.office_id = current_office.id
    @office_item.fiscal_year_id = current_fiscal_year.id
    @item_category = Office::ItemCategory.find(@office_item.item_category_id)
    @office_item.unit_en = @item_category.unit_en
    @office_item.unit_ne = @item_category.unit_ne
    @office_item.item_register_page_no = new_item_register_page_no @office_item.item_classification_no
    respond_to do |format|
      if @office_item.save
        format.html { redirect_to office_items_path, notice: 'Office item was successfully created.' }
        format.json { render :show, status: :created, location: @office_item }
      else
        format.html { render :new }
        format.json { render json: @office_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_items/1
  # PATCH/PUT /office_items/1.json
  def update
    respond_to do |format|
      if @office_item.update(office_item_params)
        format.html { redirect_to office_items_path, notice: 'Office item was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_item }
      else
        format.html { render :edit }
        format.json { render json: @office_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_items/1
  # DELETE /office_items/1.json
  def destroy
    @office_item.destroy
    respond_to do |format|
      format.html { redirect_to office_items_url, notice: 'Office item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_import
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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_item
      @office_item = Office::Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_item_params
      params.require(:office_item).permit(:specification,:item_category_id, :item_classification_no, :name_of_item_ne, :name_of_item_en, :item_category_id)
    end

  def new_item_register_page_no item_classification_no
    @items= office(Office::Item).where(item_classification_no: item_classification_no)
    if @items.count > 0
      item_register_page_no = @items.last.item_register_page_no + 1
    end
    item_register_page_no
  end

end
