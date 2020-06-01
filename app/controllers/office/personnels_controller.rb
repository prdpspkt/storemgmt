class Office::PersonnelsController < OfficeController
  before_action :set_personnel, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /personnels.html.erb
  # GET /personnels.html.erb.json
  def index
    @personnels = office(Office::Personnel).where(working: true)
    respond_to do |format|
      format.html
      format.json
      format.xlsx
      format.pdf do
        @office = current_office
        @fiscal_year = current_fiscal_year
        @report_name = "कार्यरत कर्मचारी विवरण"
        render pdf: "कर्मचारी विवरण"
      end
    end
  end

  # GET /personnels.html.erb/1
  # GET /personnels.html.erb/1.json
  def show
  end

  # GET /personnels.html.erb/new
  def new
    @personnel = Office::Personnel.new
  end

  # GET /personnels.html.erb/1/edit
  def edit
  end

  # POST /personnels.html.erb
  # POST /personnels.html.erb.json
  def create
    @personnel = Office::Personnel.new(personnel_params)
    @personnel.user_id = current_user.id
    @personnel.office_id = current_office.id
    @personnel.fiscal_year_id = current_fiscal_year.id

    respond_to do |format|
      if @personnel.save
        format.html { redirect_to @personnel, notice: 'Personnel was successfully created.' }
        format.json { render :show, status: :created, location: @personnel }
      else
        format.html { render :new }
        format.json { render json: @personnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personnels.html.erb/1
  # PATCH/PUT /personnels.html.erb/1.json
  def update
    respond_to do |format|
      if @personnel.update(personnel_params)
        format.html { redirect_to @personnel, notice: 'Personnel was successfully updated.' }
        format.json { render :show, status: :ok, location: @personnel }
      else
        format.html { render :edit }
        format.json { render json: @personnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personnels.html.erb/1
  # DELETE /personnels.html.erb/1.json
  def destroy
    @personnel.destroy
    respond_to do |format|
      format.html { redirect_to office_personnels_url, notice: 'Personnel was successfully destroyed.' }
      format.json { head :no_content }
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
      item = Office::Personnel.find_by_id(row["id"]) || Office::Personnel.new
      begin
        item.attributes = row.to_hash
      rescue Exception => error
        flash[:error] = "तपाईले अपलोड गर्नुभएको फाइलमा पहिचान नभएको कोलम हुन सक्छ त्यसलाई हटाएर पुन अपलोड गर्नुहोस् #{error.message}"
        redirect_to office_personnels_url and return
      end
      item.office_id = current_office.id
      item.user_id = current_user.id
      item
    end
    items.each do |item|
      if item.valid?
        item.save!
      else
        flash[:error] = "डाटामा गल्ति हुन सक्छ"
      end
    end
    redirect_to office_personnels_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personnel
      @personnel = Office::Personnel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personnel_params
      params.require(:office_personnel).permit(:name_ne, :name_en, :post, :phone, :address, :level_class, :service, :group, :sub_group, :ctroll, :working)
    end
end
