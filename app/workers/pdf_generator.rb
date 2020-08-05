class PdfGenerator
  def initialize(template, variables, setting)
    @template = template
    @orientation = orientation
    @setting = setting
    @av = ActionView::Base.new()
    @av.view_paths = ActionController::Base.view_paths
    @av.class_eval { include Rails.application.helpers }
    @av.instance_eval do
      variables.each { |key, value| instance_variable_set("@#{key}", value) }
    end
  end

  def generate
    WickedPdf.new.pdf_from_string(body,
                                  footer: {content: footer},
                                  header: {content: header},
                                  @setting
    )
  end

  private

  def body
    @av.render pdf: "Project Yearly Stock",
               template: @template,
               layout: 'layouts/pdf_print.pdf'
  end

  def header
    @av.render template: "layouts/print_header.pdf",
               layout: 'layouts/pdf_print.pdf'
  end

  def footer
    @av.render template: "layouts/print_footer.pdf",
               layout: 'layouts/pdf_print.pdf'
  end

end
