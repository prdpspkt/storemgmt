json.set! :data do
  json.array! @committees do |office_item_evaluation_committee|
    json.partial! 'office/item_evaluation_committees/office_item_evaluation_committee', office_item_evaluation_committee: office_item_evaluation_committee
    json.fiscal_year "#{office_item_evaluation_committee.fiscal_year.fy}"
    json.url  "
              #{link_to show_btn.html_safe, office_item_evaluation_committee }
              #{link_to edit_btn.html_safe, edit_office_item_evaluation_committee_path(office_item_evaluation_committee)}
              #{link_to destroy_btn.html_safe, office_item_evaluation_committee, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end