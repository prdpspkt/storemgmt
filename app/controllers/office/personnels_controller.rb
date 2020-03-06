class Office::PersonnelsController < ApplicationController
  before_action :set_personnel, only: [:show, :edit, :update, :destroy]

  # GET /personnels.html.erb
  # GET /personnels.html.erb.json
  def index
    @personnels = current(Office::Personnel)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personnel
      @personnel = Office::Personnel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personnel_params
      params.require(:personnel).permit(:name_ne, :name_en, :post, :phone, :address, :level_class, :service, :group, :sub_group, :ctroll)
    end
end
