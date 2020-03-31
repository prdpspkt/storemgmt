class Office::ItemEvaluationCommitteesController < ApplicationController
  before_action :set_office_item_evaluation_committee, only: [:show, :edit, :update, :destroy]

  # GET /office/item_evaluation_committees
  # GET /office/item_evaluation_committees.json
  def index
    @office_item_evaluation_committees = Office::ItemEvaluationCommittee.all
  end

  # GET /office/item_evaluation_committees/1
  # GET /office/item_evaluation_committees/1.json
  def show
  end

  # GET /office/item_evaluation_committees/new
  def new
    @office_item_evaluation_committee = Office::ItemEvaluationCommittee.new
  end

  # GET /office/item_evaluation_committees/1/edit
  def edit
  end

  # POST /office/item_evaluation_committees
  # POST /office/item_evaluation_committees.json
  def create
    @office_item_evaluation_committee = Office::ItemEvaluationCommittee.new(office_item_evaluation_committee_params)

    respond_to do |format|
      if @office_item_evaluation_committee.save
        format.html { redirect_to @office_item_evaluation_committee, notice: 'Item evaluation committee was successfully created.' }
        format.json { render :show, status: :created, location: @office_item_evaluation_committee }
      else
        format.html { render :new }
        format.json { render json: @office_item_evaluation_committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office/item_evaluation_committees/1
  # PATCH/PUT /office/item_evaluation_committees/1.json
  def update
    respond_to do |format|
      if @office_item_evaluation_committee.update(office_item_evaluation_committee_params)
        format.html { redirect_to @office_item_evaluation_committee, notice: 'Item evaluation committee was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_item_evaluation_committee }
      else
        format.html { render :edit }
        format.json { render json: @office_item_evaluation_committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office/item_evaluation_committees/1
  # DELETE /office/item_evaluation_committees/1.json
  def destroy
    @office_item_evaluation_committee.destroy
    respond_to do |format|
      format.html { redirect_to office_item_evaluation_committees_url, notice: 'Item evaluation committee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_item_evaluation_committee
      @office_item_evaluation_committee = Office::ItemEvaluationCommittee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_item_evaluation_committee_params
      params.require(:office_item_evaluation_committee).permit(:user_id, :office_id, :name, :fiscal_year_id)
    end
end
