class Office::StoreBodiesController < ApplicationController
  before_action :set_store_body, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /store_bodies
  # GET /store_bodies.json
  def index
    @store_body = office(Office::StoreBody).last
  end

  # GET /store_bodies/1
  # GET /store_bodies/1.json
  def show

  end

  # GET /store_bodies/new
  def new
    @store_body = Office::StoreBody.new
  end

  # GET /store_bodies/1/edit
  def edit
  end

  # POST /store_bodies
  # POST /store_bodies.json
  def create
    @store_body = Office::StoreBody.new(store_body_params)
    @store_body.office_id = current_office.id
    respond_to do |format|
      if @store_body.save
        format.html { redirect_to new_office_active_fiscal_year_path, notice: 'Store body was successfully created.' }
        format.json { render :show, status: :created, location: @store_body }
      else
        format.html { render :new }
        format.json { render json: @store_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_bodies/1
  # PATCH/PUT /store_bodies/1.json
  def update
    respond_to do |format|
      if @store_body.update(store_body_params)
        format.html { redirect_to @store_body, notice: 'Store body was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_body }
      else
        format.html { render :edit }
        format.json { render json: @store_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_bodies/1
  # DELETE /store_bodies/1.json
  def destroy
    @store_body.destroy
    respond_to do |format|
      format.html { redirect_to store_bodies_url, notice: 'Store body was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_body
      @store_body = Office::StoreBody.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_body_params
      params.require(:office_store_body).permit(:office_chief_name, :office_chief_degination, :section_chief_name, :section_chief_degination, :store_keeper_designation, :store_keeper_name, :status, :office_id, :fiscal_year_id)
    end
end
