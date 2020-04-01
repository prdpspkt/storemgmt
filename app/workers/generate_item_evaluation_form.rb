class GenerateItemEvaluationForm
  include Sidekiq::Worker
  sidekiq_options retry: false
  def perform(data)
    item_evaluations = Project::ItemEvaluation
        .where(office_id: data["office_id"])
        .where(fiscal_year_id: data["fiscal_year_id"])
        .where(user_id: data["user_id"])
    if item_evaluations.count > 0
      item_evaluations.destroy_all
    end
    item_evaluation = Project::ItemEvaluation.new
    item_evaluation.item_evaluation_committee_id = data["committee_id"]
    item_evaluation.report_name = data["name"]
    item_evaluation.office_id = data["office_id"]
    item_evaluation.user_id = data["user_id"]
    item_evaluation.fiscal_year_id = data["fiscal_year_id"]
    if item_evaluation.save!
      generate_evaluation_items item_evaluation
    end
  end

  def generate_evaluation_items item_evaluation
    projects = Project::Project.where(user_id: item_evaluation.user_id).where(office_id: item_evaluation.office_id).where(project_status: 0)
    projects.each do |project|
      project_items = Project::ProjectItem.where(office_id: item_evaluation.office_id).where(project_id: project.id).order("item_register_page_no ASC")
      project_items.each do |item|
        transactions = item.project_item_transactions.where("sku > 0").where(transaction_type: 1)
        if transactions.count > 0
          evaluation_item = Project::ItemEvaluationItem.new
          evaluation_item.item_evaluation_id = item_evaluation.id
          evaluation_item.project_id = project.id
          evaluation_item.office_id = item_evaluation.office_id
          evaluation_item.user_id = item_evaluation.user_id
          evaluation_item.fiscal_year_id = item_evaluation.fiscal_year_id
          evaluation_item.project_item_id = item.id
          evaluation_item.name_of_item_ne = item.name_of_item_ne
          evaluation_item.item_classification_no = item.item_classification_no
          evaluation_item.item_register_page_no = item.item_register_page_no
          evaluation_item.unit_ne = item.unit_ne
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
  end
end
