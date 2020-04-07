json.set! :data do
  json.array! @fiscal_years do |fiscal_year|
    json.partial! 'office/fiscal_years/fiscal_year', fiscal_year: fiscal_year
    json.start_date "#{ ndate fiscal_year.start_date}"
    json.closing_date "#{ ndate fiscal_year.closing_date}"
    if fiscal_year.item_transactions.count > 0 || fiscal_year.project_item_transactions.count > 0
      json.url  "
                #{link_to edit_btn.html_safe, edit_office_fiscal_year_path(fiscal_year)}
                "
    else
      json.url  "
                #{link_to edit_btn.html_safe, edit_office_fiscal_year_path(fiscal_year)}
                #{link_to destroy_btn.html_safe, fiscal_year, method: :delete, data: { confirm: 'Are you sure?' }}
                "
    end
  end
end