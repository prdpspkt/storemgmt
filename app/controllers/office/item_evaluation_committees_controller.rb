class Office::ItemEvaluationCommitteesController < OfficeController
  before_action :set_committee, only: [:show, :edit, :update, :destroy]

  # GET /office/item_evaluation_committees
  # GET /office/item_evaluation_committees.json
  def index
    @committees = current(Office::ItemEvaluationCommittee)
  end

  # GET /office/item_evaluation_committees/1
  # GET /office/item_evaluation_committees/1.json
  def show
    @committee_member = Office::ItemEvaluationCommitteeMember.new
    @committee_member.item_evaluation_committee_id = @committee.id
  end

  # GET /office/item_evaluation_committees/new
  def new
    @committee = Office::ItemEvaluationCommittee.new
  end

  # GET /office/item_evaluation_committees/1/edit
  def edit
  end

  # POST /office/item_evaluation_committees
  # POST /office/item_evaluation_committees.json
  def create
    @committee = Office::ItemEvaluationCommittee.new(committee_params)
    @committee = set_current_information @committee
    respond_to do |format|
      if @committee.save
        format.html { redirect_to @committee, notice: 'Item evaluation committee was successfully created.' }
        format.json { render :show, status: :created, location: @committee }
      else
        format.html { render :new }
        format.json { render json: @committee.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_member
    @committee_member = Office::ItemEvaluationCommitteeMember.new(committee_member_params)
    @committee_member = set_current_information(@committee_member)
    @committee = @committee_member.item_evaluation_committee
    if @committee_member.save!
      redirect_to @committee
    else
      render :show
    end
  end

  def destroy_member
    @committee_member = Office::ItemEvaluationCommitteeMember.find(params[:id])
    @committee = @committee_member.item_evaluation_committee
    @committee_member.destroy

  end

  # PATCH/PUT /office/item_evaluation_committees/1
  # PATCH/PUT /office/item_evaluation_committees/1.json
  def update
    respond_to do |format|
      if @committee.update(committee_params)
        format.html { redirect_to @committee, notice: 'Item evaluation committee was successfully updated.' }
        format.json { render :show, status: :ok, location: @committee }
      else
        format.html { render :edit }
        format.json { render json: @committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office/item_evaluation_committees/1
  # DELETE /office/item_evaluation_committees/1.json
  def destroy
    @committee.destroy
    respond_to do |format|
      format.html { redirect_to office_item_evaluation_committees_url, notice: 'Item evaluation committee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee
      @committee = Office::ItemEvaluationCommittee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committee_params
      params.require(:office_item_evaluation_committee).permit(:name, :committee_formation_date, :report_submission_date)
    end

  def committee_member_params
    params.required(:office_item_evaluation_committee_member).permit(:personnel_id, :item_evaluation_committee_id, :role)
  end
end
