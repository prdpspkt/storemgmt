json.set! :data do
  json.array! @item_disposals do |item_disposal|
    json.partial! 'office/item_disposals/item_disposal', item_disposal: item_disposal
    json.fy "#{item_disposal.fiscal_year.fy}"
    json.decision_date "#{ ndate item_disposal.decision_date}"
    json.url  "
              #{link_to show_btn.html_safe, item_disposal }
              #{link_to edit_btn.html_safe, edit_office_item_disposal_path(item_disposal)}
              #{link_to destroy_btn.html_safe, item_disposal, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end