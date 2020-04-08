class FiscalYearClosingWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(data)
    office = Office::Office.find(data["office_id"])
    old_fiscal_year = Office::FiscalYear.find(data["old_fiscal_year_id"])
    fiscal_year = Office::FiscalYear.find(data["fiscal_year_id"])
    #copy old store body
    old_store_body = old_fiscal_year.store_bodies.last
    store_body = Office::StoreBody.new(old_store_body.attributes.select { |key, _| Office::StoreBody.column_names.include? key })
    store_body.fiscal_year_id = fiscal_year.id
    store_body.id = nil
    store_body.save

    ## Create office_item_transaction

    items = Office::Item.where(office_id: office.id)
    items.each do |item|
      transactions = Office::ItemTransaction.where(office_id: office.id)
                         .where(fiscal_year_id: old_fiscal_year.id)
                         .where(item_id: item.id)
                         .where("sku > 0")
                         .where(item_classification_no: 52)
      if transactions.count > 0
        transaction = Office::ItemTransaction.new(transactions.last.attributes.select { |key, _| Office::ItemTransaction.column_names.include? key })
        transaction.id = nil
        transaction.rate = transactions.average(:rate)
        transaction.quantity = transactions.sum(:sku)
        transaction.amount = transaction.rate * transaction.quantity
        transaction.transaction_date = fiscal_year.start_date
        transaction.transaction_type = 1
        transaction.store_body_id = store_body.id
        transaction.fiscal_year_id = fiscal_year.id
        transaction.remarks = "गत आ.व. बाट अल्या"
        if transaction.save!
          transaction1 = Office::ItemTransaction.new(transactions.last.attributes.select { |key, _| Office::ItemTransaction.column_names.include? key })
          transaction1.id = nil
          transaction1.rate = transactions.average(:rate)
          transaction1.quantity = transactions.sum(:sku)
          transaction1.amount = transaction.rate * transaction.quantity
          transaction1.transaction_date = old_fiscal_year.closing_date
          transaction1.transaction_type = -1
          transaction1.store_body_id = old_store_body.id
          transaction1.fiscal_year_id = old_fiscal_year.id
          transaction1.remarks = "आ.व.को अन्त्य गरी नयाँ आ.व.मा सारिएको"
          transaction.save!
        end
      end
    end
## Copying project Transactions
    projects = Project::Project.where(office_id: office.id).where(project_status: false)
    projects.each do |project|
      items = project.project_items
      items.each do |item|
        transactions = Project::ProjectItemTransaction.where(office_id: office.id)
                           .where(fiscal_year_id: old_fiscal_year.id)
                           .where(project_id: project.id)
                           .where(project_item_id: item.id)
                           .where("sku > 0")
        if transactions.count > 0
          transaction = Project::ProjectItemTransaction.new(transactions.last.attributes.select { |key, _| Project::ProjectItemTransaction.column_names.include? key })
          transaction.id = nil
          transaction.rate = transactions.average(:rate)
          transaction.quantity = transactions.sum(:sku)
          transaction.amount = transaction.rate * transaction.quantity
          transaction.transaction_date = fiscal_year.start_date
          transaction.transaction_type = 1
          transaction.store_body_id = store_body.id
          transaction.fiscal_year_id = fiscal_year.id
          transaction.remarks = "गत आ.व. बाट अल्या"
          if transaction.save!
            transaction1 = Project::ProjectItemTransaction.new(transactions.last.attributes.select { |key, _| Project::ProjectItemTransaction.column_names.include? key })
            transaction1.id = nil
            transaction1.rate = transactions.average(:rate)
            transaction1.quantity = transactions.sum(:sku)
            transaction1.amount = transaction.rate * transaction.quantity
            transaction1.transaction_date = old_fiscal_year.closing_date
            transaction1.transaction_type = -1
            transaction1.store_body_id = old_store_body.id
            transaction1.fiscal_year_id = old_fiscal_year.id
            transaction1.remarks = "आ.व. अन्त्य गरी नयाँ आ.व.मा सारिएको"
            transaction1.save!
          end
        end
      end
    end
    old_fiscal_year.status = true
    old_fiscal_year.save
  end
end

