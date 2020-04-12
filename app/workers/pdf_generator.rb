class PdfGenerator
  def initialize(template, options)
    @template = template
    @av = ActionView::Base.new()
    @av.view_paths = ActionController::Base.view_paths
    @av.class_eval { include Rails.application.helpers }
    @av.instance_eval do
      options.each { |key, value| instance_variable_set("@#{key}", value) }
    end
  end

  def generate
    WickedPdf.new.pdf_from_string(body, footer: {content: footer}, header: {content: header})
  end

  private
  def body
    @av.render pdf: "Project Yearly Stock",
               template: @template,
               layout: 'layouts/pdf_print.html'
  end

  def header
    @av.render template: "layouts/print_header.html",
               layout: 'layouts/pdf_print.html'
  end

  def footer
    @av.render template: "layouts/print_footer.html",
               layout: 'layouts/pdf_print.html'
  end

end
