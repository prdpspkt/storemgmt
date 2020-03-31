class Project::ItemEvaluationsController < ProjectController
  before_action :set_project_item_evaluation, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]

  def index
   @item_evaluations = Project::ItemEvaluation.all
  end

  # GET /project_item_evaluations/1
  # GET /project_item_evaluations/1.json
  def show

  end

  def generate
   @item_evaluations = current(Project::ItemEvaluation)
    if@item_evaluations.count > 0
     @item_evaluations.destroy_all
    end
   @item_evaluation = Project::ItemEvaluation.new
   @item_evaluation = set_current_information@item_evaluation
   @item_evaluation.store_body_id = current_control_body.id
    if@item_evaluation.save!
      generate_evaluation_items @item_evaluation.id
    end
    redirect_to project_item_evaluations_url
  end

  private

  def generate_evaluation_items evaluation_id
    @projects = office(Project::Project).where(project_status: 0)
    @projects.each do |project|
      project.project_items.each do |item|
        transactions = item.project_item_transactions.where("sku > 0").where(transaction_type: 1)
        evaluation_item = Project::ItemEvaluationItem.new
        evaluation_item.item_evaluation_id = evaluation_id
        evaluation_item.project_id = project.id
        evaluation_item = set_current_information evaluation_item
        evaluation_item.store_body_id = current_control_body.id
        evaluation_item.project_item_id = item.id
        evaluation_item.quantity = transactions.sum(:sku)
        evaluation_item.rate = transactions.average(:rate)
        evaluation_item.matched = evaluation_item.quantity
        evaluation_item.working = evaluation_item.quantity
        evaluation_item.total_quantity = evaluation_item.quantity
        begin
          evaluation_item.amount = evaluation_item.quantity * evaluation_item.rate
        rescue Exception => error
          logger.info(error.message)
        end
        evaluation_item.item_id = item.item_id
        evaluation_item.save!
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project_item_evaluation
   @item_evaluation = Project::ItemEvaluation.find(params[:id])
  end


end
