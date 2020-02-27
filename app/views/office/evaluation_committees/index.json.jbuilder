json.set! :data do
  json.array! @office_item_evaluation_committees do |office_item_evaluation_committee|
    json.partial! 'office_item_evaluation_committees/office_item_evaluation_committee', office_item_evaluation_committee: office_item_evaluation_committee
    json.url  "
              #{link_to 'Show', office_item_evaluation_committee }
              #{link_to 'Edit', edit_office_item_evaluation_committee_path(office_item_evaluation_committee)}
              #{link_to 'Destroy', office_item_evaluation_committee, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end