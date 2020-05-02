class OfficeEvaluationGenerator
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(data)
    ActionCable.server.broadcast "progress_channel", response: {message: "We are generating evaluation report in background please wait..."}
    item_evaluations = Office::ItemEvaluation
                           .where(office_id: data["office_id"])
                           .where(fiscal_year_id: data["fiscal_year_id"])
                           .where(user_id: data["user_id"])
    if item_evaluations.count > 0
      item_evaluations.destroy_all
    end
    item_evaluation = Office::ItemEvaluation.new
    item_evaluation.item_evaluation_committee_id = data["committee_id"]
    item_evaluation.report_name = data["name"]
    item_evaluation.office_id = data["office_id"]
    item_evaluation.user_id = data["user_id"]
    item_evaluation.fiscal_year_id = data["fiscal_year_id"]
    item_evaluation.file = 'false'
    if item_evaluation.save!
      generate_evaluation_items item_evaluation
    end
    ActionCable.server.broadcast "progress_channel", response: {closed: true, message: " "}
  end

  def generate_evaluation_items item_evaluation
    office_items = Office::Item.where(office_id: item_evaluation.office_id).where(item_classification_no: 47).order("id ASC")
    office_items.each do |item|
      transactions = item.item_transactions.where("sku > 0").where(transaction_type: 1)
      if transactions.count > 0
        evaluation_item = Office::ItemEvaluationItem.new
        evaluation_item.item_evaluation_id = item_evaluation.id
        evaluation_item.office_id = item_evaluation.office_id
        evaluation_item.user_id = item_evaluation.user_id
        evaluation_item.fiscal_year_id = item_evaluation.fiscal_year_id
        evaluation_item.name_of_item_ne = item.name_of_item_ne
        evaluation_item.name_of_item_en = item.name_of_item_en
        evaluation_item.item_classification_no = item.item_classification_no
        evaluation_item.item_register_page_no = item.item_register_page_no
        evaluation_item.unit_ne = item.unit_ne
        evaluation_item.unit_en = item.unit_en
        evaluation_item.quantity = transactions.sum(:sku)
        evaluation_item.rate = (transactions.sum(:amount)/transactions.sum(:quantity)).round(2)
        evaluation_item.matched = evaluation_item.quantity
        evaluation_item.working = evaluation_item.quantity
        evaluation_item.total_quantity = evaluation_item.quantity
        begin
          evaluation_item.amount = evaluation_item.quantity * evaluation_item.rate
        rescue Exception => error
          logger.info(error.message)
        end
        evaluation_item.item_id = item.id
        evaluation_item.save!
      end
    end
  end
end

