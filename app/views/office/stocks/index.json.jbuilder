json.set! :data do
  json.array! @office_stocks do |office_stock|
    json.partial! 'office/stocks/office_stock', office_stock: office_stock
    json.fy "#{office_stock.fiscal_year.fy}"
    json.office_name "#{office_stock.office.office}"
    json.description "वार्षिक मौज्दात विवरण"

    json.url  "
              #{link_to show_btn.html_safe, print_office_stock_url(office_stock, format: :pdf), target: "_blank" }
              "
  end
end