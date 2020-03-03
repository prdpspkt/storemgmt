class Office::ItemCategoriesController < ApplicationController
  before_action :set_item_category, only: [:show, :edit, :update, :destroy]

  # GET /item_categories
  # GET /item_categories.json
  def index
    @item_categories = office(Office::ItemCategory)
  end

  # GET /item_categories/1
  # GET /item_categories/1.json
  def show
  end

  # GET /item_categories/new
  def new
    @item_category = Office::ItemCategory.new
  end

  # GET /item_categories/1/edit
  def edit
  end

  # POST /item_categories
  # POST /item_categories.json
  def create
    @item_category = Office::ItemCategory.new(item_category_params)
    @item_category.office_id = current_office.id
    respond_to do |format|
      if @item_category.save
        format.html { redirect_to office_item_categories_path, notice: 'Item category was successfully created.' }
        format.json { render :show, status: :created, location: @item_category }
      else
        format.html { render :new }
        format.json { render json: @item_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_categories/1
  # PATCH/PUT /item_categories/1.json
  def update
    respond_to do |format|
      if @item_category.update(item_category_params)
        format.html { redirect_to office_item_categories_path, notice: 'Item category was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_category }
      else
        format.html { render :edit }
        format.json { render json: @item_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_categories/1
  # DELETE /item_categories/1.json
  def destroy
    @item_category.destroy
    respond_to do |format|
      format.html { redirect_to office_item_categories_url, notice: 'Item category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_import
    file = params[:file]
    spreadsheet = case File.extname(file.original_filename)
                  when ".csv" then Csv.new(file.path, nil, :ignore)
                  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
                  when ".xlsx" then Roo::Excelx.new(file.path)
                  else raise "Unknown file type: #{file.original_filename}"
                  end
    header = spreadsheet.row(1)
    items = (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      item = Office::ItemCategory.find_by_id(row["id"]) || Office::ItemCategory.new
      item.attributes = row.to_hash
      item.office_id = current_office.id
      item.user_id = current_user.id
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
    redirect_to office_item_categories_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_category
      @item_category = Office::ItemCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_category_params
      params.require(:office_item_category).permit(:name_ne, :name_en,  :unit_ne, :unit_en, :user_id, :office_id)
    end

end
