class Office::ItemEvaluationsController < OfficeController
  before_action :set_office_item_evaluation, only: [:show, :update, :print, :print_pdf]
  load_and_authorize_resource except: [:create, :new]

  def index
    @item_evaluations = Office::ItemEvaluation.all
  end


  # GET /office_item_evaluations/1
  # GET /office_item_evaluations/1.json
  def new
    @item_evaluation = Office::ItemEvaluation.new
    @item_evaluation_committees = current(Office::ItemEvaluationCommittee)
  end

  def show
    @item_evaluation_items = Office::ItemEvaluationItem.where(item_evaluation_id: @item_evaluation.id)
                                 .order("item_id ASC")
  end


  def generate
    data = {
        name: item_evaluation_params[:name],
        committee_id: item_evaluation_params[:item_evaluation_committee_id],
        office_id: current_office.id,
        user_id: current_user.id,
        fiscal_year_id: current_fiscal_year.id
    }
    OfficeEvaluationGenerator.perform_async(data)
    redirect_to office_item_evaluations_url, notice: "जिन्सी निरीक्षण कार्य हुँदै छ, कृपया केहि समय पछि यो पेज रिफ्रेस गर्नु होस्, धन्यवाद |"
  end

  def print
    @item_evaluation_items = Office::ItemEvaluationItem.where(item_evaluation_id: @item_evaluation.id)
                                 .order("item_id ASC")
    respond_to do |format|
      format.html
      format.pdf do
          data = File.open(@item_evaluation.file, 'rb') { |io| io.read }
          send_data(data, type: 'application/pdf', disposition: :inline)
      end
    end
  end

  def print_pdf
      OfficeEvaluationReportGenerator.perform_async(@item_evaluation.id)
      redirect_to @item_evaluation, notice:  "Generating printable pdf file in background please come back later."
  end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_office_item_evaluation
    @item_evaluation = Office::ItemEvaluation.find(params[:id])
  end

  def item_evaluation_params
    params.require(:office_item_evaluation).permit(:name, :item_evaluation_committee_id)
  end


end
