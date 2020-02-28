json.set! :data do
  json.array! @fiscal_years do |fiscal_year|
    json.partial! 'office/fiscal_years/fiscal_year', fiscal_year: fiscal_year
    json.url  "
              #{link_to edit_btn.html_safe, edit_office_fiscal_year_path(fiscal_year)}
              #{link_to destroy_btn.html_safe, fiscal_year, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end