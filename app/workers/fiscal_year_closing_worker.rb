class FiscalYearClosingWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(data)
    @office = Office::Office.find(data["office_id"])
    @old_fiscal_year = Office::FiscalYear.find(data["old_fiscal_year_id"])
    @fiscal_year = Office::FiscalYear.find(data["fiscal_year_id"])
    @user = @office.user
    #copy old store body
    copy_store_body


    ## Create office_item_transaction
    items = Office::Item.where(office_id: @office.id)
                .where(fiscal_year_id: @old_fiscal_year.id)
                .where(item_classification_no: 407)
    items.each do |item|
      transactions = get_office_item_transactions(item.id)
      if transactions.count > 0

        create_office_item_transaction transactions, item
      end
    end

    ## Copying project Transactions
    projects = Project::Project.where(office_id: @office.id).where(project_status: false)
    projects.each do |project|
      items = Project::ProjectItem.where(project_id: project.id)
                  .where(office_id: @office.id)
                  .where(fiscal_year_id: @old_fiscal_year.id)
                  .where(item_classification_no: 407)
      items.each do |item|
        transactions = get_project_item_transactions project.id, item.id
        if transactions.count.positive?
          create_project_item_transaction transactions, item
        end
      end
    end
    @old_fiscal_year.status = true
    @old_fiscal_year.save!
  end

  private

  def copy_store_body
    @old_store_body = @old_fiscal_year.store_bodies.last
    @store_body = Office::StoreBody.new(@old_store_body.attributes.select { |key, _| Office::StoreBody.column_names.include? key })
    @store_body.fiscal_year_id = @fiscal_year.id
    @store_body.id = nil
    @store_body.save!
  end


  def get_project_item_transactions project_id, project_item_id
    Project::ProjectItemTransaction.where(office_id: @office.id)
        .where(fiscal_year_id: @old_fiscal_year.id)
        .where(project_id: project_id)
        .where(project_item_id: project_item_id)
        .where(item_classification_no: 407)
        .where("sku > 0")
  end

  def create_project_item project_item
    new_item = Project::ProjectItem.where(office_id: @office.id)
                   .where(fiscal_year_id: @fiscal_year.id)
                   .where(project_id: project_item.project_id)
                   .where(item_id: project_item.item_id).
        where(item_classification_no: 407).first
    if new_item.blank?
      new_item = Project::ProjectItem.new(project_item.attributes.select { |key, _| Project::ProjectItem.column_names.include? key })
      new_item.id = nil
      new_item.item_classification_no = 407
      new_item.item_register_page_no = new_project_item_register_page_no project_item.project_id
      new_item.fiscal_year_id = @fiscal_year.id
      new_item.save!
    end
    new_item
  end

  def new_project_item_register_page_no project_id
    item_register_page_no = 1
    items = Project::ProjectItem.where(office_id: @office.id)
                .where(fiscal_year_id: @fiscal_year.id)
                .where(project_id: project_id)
                .where(item_classification_no: 407)
    if items.count.positive?
      item_register_page_no = items.last.item_register_page_no + 1
    end
    item_register_page_no
  end

  def create_project_item_transaction transactions, item
    transaction = Project::ProjectItemTransaction.new(transactions.last.attributes.select { |key, _| Project::ProjectItemTransaction.column_names.include? key })
    transaction.id = nil
    transaction.rate = transactions.average(:rate)
    transaction.quantity = transactions.sum(:sku)
    transaction.amount = transaction.rate * transaction.quantity
    transaction.transaction_date = @fiscal_year.start_date
    transaction.transaction_type = 1
    transaction.sku = transaction.quantity
    transaction.project_item_id = create_project_item(item).id
    transaction.store_body_id = @store_body.id
    transaction.fiscal_year_id = @fiscal_year.id
    transaction.remarks = "आ.व. #{@old_fiscal_year.fy } बाट अल्या"
    transaction.save!
    create_project_item_expense_transaction transactions
  end

  def create_project_item_expense_transaction transactions
    transaction = Project::ProjectItemTransaction.new(transactions.last.attributes.select { |key, _| Project::ProjectItemTransaction.column_names.include? key })
    transaction.id = nil
    transaction.rate = transactions.average(:rate)
    transaction.quantity = transactions.sum(:sku)
    transaction.amount = transaction.rate * transaction.quantity
    transaction.transaction_date = @old_fiscal_year.closing_date
    transaction.transaction_type = -1
    transaction.store_body_id = @old_store_body.id
    transaction.fiscal_year_id = @old_fiscal_year.id
    transaction.office_id = @office.id
    transaction.remarks = "नयाँ आर्थिक वर्ष #{@fiscal_year.fy} मा सारिएको"
    transaction.save!
  end


  def get_office_item_transactions item_id
    Office::ItemTransaction.where(office_id: @office.id)
        .where(fiscal_year_id: @old_fiscal_year.id)
        .where(item_id: item_id)
        .where(item_classification_no: 407)
        .where("sku > 0")
  end

  def create_office_item item
    new_item = Office::Item.where(office_id: @office.id)
                   .where(fiscal_year_id: @fiscal_year_id)
                   .where(pool_item_id: item.pool_item_id).first
    if new_item.blank?
      new_item = Office::Item.new(item.attributes.select { |key, _| Office::Item.column_names.include? key })
      new_item.id = nil
      new_item.item_register_page_no = new_office_item_register_page_no
      new_item.fiscal_year_id = @fiscal_year.id
      new_item.save!
    end
    new_item
  end

  def new_office_item_register_page_no
    item_register_page_no = 1
    items = Office::Item.where(office_id: @office.id).where(fiscal_year_id: @fiscal_year.id).where(item_classification_no: 407)
    if items.count.positive?
      item_register_page_no = items.last.item_register_page_no + 1
    end
    item_register_page_no
  end

  def create_office_item_transaction transactions, item
    transaction = Office::ItemTransaction.new(transactions.last.attributes.select { |key, _| Office::ItemTransaction.column_names.include? key })
    transaction.id = nil
    transaction.item_id = create_office_item(item).id
    transaction.rate = transactions.average(:rate)
    transaction.quantity = transactions.sum(:sku)
    transaction.amount = transaction.rate * transaction.quantity
    transaction.transaction_date = @fiscal_year.start_date
    transaction.transaction_type = 1
    transaction.store_body_id = @store_body.id
    transaction.fiscal_year_id = @fiscal_year.id
    transaction.remarks = "गत आ.व. बाट अल्या"
    transaction.save!
    create_office_item_expense_transaction transactions
  end

  def create_office_item_expense_transaction transactions
    transaction1 = Office::ItemTransaction.new(transactions.last.attributes.select { |key, _| Office::ItemTransaction.column_names.include? key })
    transaction1.id = nil
    transaction1.rate = transactions.sum(:amount) / transactions.sum(:quantity)
    transaction1.quantity = transactions.sum(:sku)
    transaction1.amount = transaction1.rate * transaction1.quantity
    transaction1.transaction_date = @old_fiscal_year.closing_date
    transaction1.transaction_type = -1
    transaction1.store_body_id = @old_store_body.id
    transaction1.fiscal_year_id = @old_fiscal_year.id
    transaction1.remarks = "आ.व. #{@fiscal_year.fy} को जिन्सी खातामा सारिएको"
    transaction1.save!
  end
end

