class Office::FiscalYearsController < ApplicationController
  before_action :set_fiscal_year, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /fiscal_years
  # GET /fiscal_years.json
  def index
    @fiscal_years = office(Office::FiscalYear)
  end


  # GET /fiscal_years/new
  def new
    @fiscal_year = Office::FiscalYear.new
  end

  # GET /fiscal_years/1/edit
  def edit
  end

  # POST /fiscal_years
  # POST /fiscal_years.json
  def create
    @fiscal_year = Office::FiscalYear.new(fiscal_year_params)
    @fiscal_year.office_id = current_office.id
    @fiscal_year.status = false
    respond_to do |format|
      if @fiscal_year.save
        if current_office.fiscal_years.count == 1
          @active_fiscal_year = ActiveFiscalYear.new
          @active_fiscal_year.fy = @fiscal_year.fy
          @active_fiscal_year.fiscal_year_id = @fiscal_year.id
          @active_fiscal_year.office_id = @fiscal_year.office_id
          @active_fiscal_year.save
        end
        if @fiscal_year.office.fiscal_years.count > 1
          format.html { redirect_to office_fiscal_years_path, notice: 'Fiscal year was successfully created.' }
          format.json { render :show, status: :created, location: @fiscal_year }
        else
          format.html { redirect_to new_office_store_body_path, notice: 'Fiscal year was successfully created.' }
          format.json { render :show, status: :created, location: @fiscal_year }
        end
      else
        format.html { render :new }
        format.json { render json: @fiscal_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiscal_years/1
  # PATCH/PUT /fiscal_years/1.json
  def update
    respond_to do |format|
      if @fiscal_year.update(fiscal_year_params)
        format.html { redirect_to office_fiscal_years_path, notice: 'Fiscal year was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiscal_year }
      else
        format.html { render :edit }
        format.json { render json: @fiscal_year.errors, status: :unprocessable_entity }
      end
    end
  end

  def close_form
    @fiscal_years = Office::FiscalYear.where(office_id: current_office.id).where.not(status: true)
  end

  def close
    @office = current_office
    @fiscal_year = Office::FiscalYear.find(params[:fiscal_year_id])
    if @fiscal_year.office_id == @office.id
      create_store_body
      create_office_item_transactions
      create_project_item_transactions
      @fiscal_year.status = true
      @fiscal_year.save
      sign_out current_user
      redirect_to '/', notice: "Please login to new Fiscal Year."
    end
  end

  # DELETE /fiscal_years/1
  # DELETE /fiscal_years/1.json
  def destroy
    @fiscal_year.destroy
    respond_to do |format|
      format.html { redirect_to office_fiscal_years_url, notice: 'Fiscal year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fiscal_year
    @fiscal_year = Office::FiscalYear.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fiscal_year_params
    params.require(:office_fiscal_year).permit(:fy, :start_date, :closing_date)
  end

  def create_office_item_transactions
    items = Office::Item.where(office_id: @office.id)
    items.each do |item|
      transactions = Office::ItemTransaction.where(office_id: @office.id)
                         .where(fiscal_year_id: @fiscal_year.id)
                         .where(item_id: item.id)
                         .where("sku > 0")
                         .where(item_classification_no: 52)
      if transactions.count > 0
        transaction = Office::ItemTransaction.new(transactions.last.attributes.select { |key, _| Office::ItemTransaction.column_names.include? key })
        transaction.id = nil
        transaction.rate = transactions.average(:rate)
        transaction.quantity = transactions.sum(:sku)
        transaction.amount = transaction.rate * transaction.quantity
        transaction.transaction_date = @fiscal_year.start_date
        transaction.transaction_type = 1
        transaction.store_body_id = @store_body.id
        transaction.fiscal_year_id = current_fiscal_year.id
        transaction.remarks = "गत आ.व. बाट अल्या"
        transaction.save!
      end
    end
  end

  def create_project_item_transactions
    @projects = Project::Project.where(office_id: current_office.id).where(project_status: false)
    @projects.each do |project|
      items = project.project_items
      items.each do |item|
        transactions = Project::ProjectItemTransaction.where(office_id: @office.id)
                           .where(fiscal_year_id: @fiscal_year.id)
                           .where(project_id: project.id)
                           .where(project_item_id: item.id)
                           .where("sku > 0")
        if transactions.count > 0
          transaction = Project::ProjectItemTransaction.new(transactions.last.attributes.select { |key, _| Project::ProjectItemTransaction.column_names.include? key })
          transaction.id = nil
          transaction.rate = transactions.average(:rate)
          transaction.quantity = transactions.sum(:sku)
          transaction.amount = transaction.rate * transaction.quantity
          transaction.transaction_date = @fiscal_year.start_date
          transaction.transaction_type = 1
          transaction.store_body_id = @store_body.id
          transaction.fiscal_year_id = current_fiscal_year.id
          transaction.remarks = "गत आ.व. बाट अल्या"
          transaction.save!
        end
      end
    end
  end

  def create_store_body
    store_body = @fiscal_year.store_bodies.last
    @store_body = Office::StoreBody.new(store_body.attributes.select{|key, _| Office::StoreBody.column_names.include? key})
    @store_body.fiscal_year_id = current_fiscal_year.id
    @store_body.save
  end

end

