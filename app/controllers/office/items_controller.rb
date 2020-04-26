class Office::ItemsController < OfficeController
  before_action :set_office_item, only: [:show, :destroy, :expense_register]
  load_and_authorize_resource except: [:create, :new]
  # GET /office_items
  # GET /office_items.json
  def expense_index
    @items = current(Office::Item).where(item_classification_no: 52)
    @print_url = expense_index_office_items_url(format: :pdf)
    respond_to do |format|
      format.html
      format.json
      format.xlsx do
        render 'index'
      end
      format.pdf do
        @office = current_office
        @fiscal_year = current_fiscal_year
        @report_name = "खर्च भएर जाने जिन्सी सामानको सूची"
        render pdf: "items", template: "office/items/index"
      end
    end
  end

  def non_expense_index
    @items = office(Office::Item).where(item_classification_no: 47)
    @print_url = non_expense_index_office_items_url(format: :pdf)
    respond_to do |format|
      format.html
      format.json
      format.xlsx do
        render 'index'
      end
      format.pdf do
        @office = current_office
        @fiscal_year = current_fiscal_year
        @report_name = "खर्च भएर नजाने जिन्सी सामानको सूची"
        render pdf: "items", template: "office/items/index"
      end
    end
  end

  # GET /office_items/1
  # GET /office_items/1.json
  def show
  end


  # DELETE /office_items/1
  # DELETE /office_items/1.json
  def destroy
    icn = @item.item_classification_no
    if icn == 47
      @url_to_go = non_expense_index_office_items_url
    else
      @url_to_go = expense_index_office_items_path
    end
    @item.destroy
    respond_to do |format|
      if Office::Item.exists?(@item.id)
        flash[:error] = @item.errors[:base][0].to_s
        format.html { redirect_to @url_to_go }
        format.json { head :no_content }
      else
        format.html { redirect_to @url_to_go, notice: "Successfully deleted." }
        format.json { head :no_content }
      end
    end
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
end
