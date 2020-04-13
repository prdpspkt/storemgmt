class ProjectEvaluationReportGenerator
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(item_evaluation_id)
    item_evaluation = Project::ItemEvaluation.find(item_evaluation_id)
    data = {
        office: item_evaluation.office,
        fiscal_year: item_evaluation.fiscal_year,
        report_name: "जिन्सी निरीक्षण प्रतिवेदन फाराम",
        form_no: 411,
        old_form_no: 49,
        item_evaluation: item_evaluation
    }
    generator = PdfGenerator.new('project/item_evaluations/print.pdf', data, "landscape")
    pdf = generator.generate
    dir = Rails.root.join("pdfs", "#{item_evaluation.office.id}", "#{item_evaluation.fiscal_year.id}")
    if File.directory?(dir) == false
      FileUtils.mkdir_p dir
    end
    pdf_path = Rails.root.join("pdfs", "#{item_evaluation.office.id}", "#{item_evaluation.fiscal_year.id}", "project-item-evaluation-report.pdf")
    File.open(pdf_path, 'wb') do |file|
      file << pdf
    end
    item_evaluation.file = pdf_path
    item_evaluation.save
  end
end

