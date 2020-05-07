class ProjectProjectNonExpensableItemRegisterGenerator
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform office_id, fiscal_year_id, store_body_id, project_id
     ActionCable.server.broadcast "progress_channel", response: { message: "We are generating report in background.."};
    items = Project::ProjectItem.where(office_id: office_id).where(item_classification_no: 47).where(project_id: project_id)
    office = Office::Office.find(office_id)
    fiscal_year = Office::FiscalYear.find(fiscal_year_id)
    cb = Office::StoreBody.find(store_body_id)
    project = Project::Project.find(project_id)
    generate_and_save_pdf office, fiscal_year, items, cb, project
     ActionCable.server.broadcast "progress_channel", response: { message: "We are generating report in background..", closed: true};
   
  end

  private


  def generate_and_save_pdf office, fiscal_year, items, cb, project
    data = {
        office: office,
        fiscal_year: fiscal_year,
        report_name: "खर्च भएर नजाने(खप्ने) जिन्सी खाता",
        form_no: 408,
        old_form_no: 47,
        items: items,
        cb: cb,
        project: project
    }
    generator = PdfGenerator.new('project/projects/non_expense_item_register.pdf', data, "landscape")
    pdf = generator.generate
    dir = Rails.root.join("pdfs", "#{office.id}", "#{fiscal_year.id}", "#{project.id}")
    if File.directory?(dir) == false
      FileUtils.mkdir_p dir
    end
    pdf_path = Rails.root.join("pdfs", "#{office.id}", "#{fiscal_year.id}", "#{project.id}","non-expensable-item-register.pdf")
    File.open(pdf_path, 'wb') do |file|
      file << pdf
    end
  end
end