# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md
if Rails.env == "production"
  WickedPdf.config = {
      # Path to the wkhtmltopdf executable: This usually isn't needed if using
      # one of the wkhtmltopdf-binary family of gems.
      # exe_path: '/usr/local/bin/wkhtmltopdf',
      #   or
      exe_path: '/usr/local/bin/wkhtmltopdf',
      layout: 'layouts/pdf_print.pdf',
      page_size: 'A4',
      print_media_type: true,
      header: {
          html: {
              template: "layouts/print_header.pdf"
          }
      },
      footer: {
          html: {
              template: "layouts/print_footer.pdf"
          }
      },
      margin: {left: '17mm',
               right: '7mm',
               bottom: '10mm'
      },
      encoding: "utf-8"

      # Layout file to be used for all PDFs
      # (but can be overridden in `render :pdf` calls)
      # layout: 'pdf.html',
  }
else
  WickedPdf.config = {
      # Path to the wkhtmltopdf executable: This usually isn't needed if using
      # one of the wkhtmltopdf-binary family of gems.
      # exe_path: '/usr/local/bin/wkhtmltopdf',
      #   or
      exe_path: 'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe',
      layout: 'layouts/pdf_print',
      page_size: 'A4',
      print_media_type: true,
      header: {
          html: {
              template: "layouts/print_header"
          }
      },
      footer: {
          html: {
              template: "layouts/print_footer"
          }
      },
      margin: {left: '17mm',
               right: '7mm',
               bottom: '10mm'
      },
      encoding: "utf-8"

      # Layout file to be used for all PDFs
      # (but can be overridden in `render :pdf` calls)
      # layout: 'pdf.html',
  }
end
