json.set! :data do
  json.array! @project_stocks do |project_stock|
    json.partial! 'project/stocks/project_stock', project_stock: project_stock
    json.fy "#{project_stock.fiscal_year.fy}"
    json.office_name "#{project_stock.office.office}"
    json.description "वार्षिक मौज्दात विवरण"
    if project_stock.file != "false"
      json.url "
               #{link_to show_btn.html_safe, project_stock_path(project_stock, format: :pdf), target: "_blank" }
               "
    else
      json.url ""
    end
  end
end