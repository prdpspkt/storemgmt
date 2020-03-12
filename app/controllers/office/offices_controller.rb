class Office::OfficesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_office, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new, :index]
  # GET /offices
  # GET /offices.json
  def index
    if current_office.new_record?
      redirect_to(new_office_office_path) and return
    end

    @office = current_office
    @store_body = current_control_body
  end

  # GET /offices/1
  # GET /offices/1.json
  def show
  end

  # GET /offices/new
  def new
    @office = Office::Office.new
    @personnels = current_user.personnels
  end

  # GET /offices/1/edit
  def edit
  end

  # POST /offices
  # POST /offices.json
  def create
    @office = Office::Office.new(office_params)
    @office.user_id = current_user.id
    respond_to do |format|
      if @office.save
        format.html { redirect_to new_office_fiscal_year_path, notice: 'Office was successfully created.' }
        format.json { render :show, status: :created, location: @office }
      else
        format.html { render :new }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offices/1
  # PATCH/PUT /offices/1.json
  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to root_path, notice: 'Office was successfully updated.' }
        format.json { render :show, status: :ok, location: @office }
      else
        format.html { render :edit }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1
  # DELETE /offices/1.json
  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to offices_url, notice: 'Office was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office::Office.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_params
      params.require(:office_office).permit(:gov, :ministry, :department, :office, :address, :phone, :fax, :email, :user_id)
    end
end
