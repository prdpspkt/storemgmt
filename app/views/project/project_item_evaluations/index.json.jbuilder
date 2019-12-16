json.set! :data do
  json.array! @office_item_evaluations do |office_item_evaluation|
    json.partial! 'office_item_evaluations/office_item_evaluation', office_item_evaluation: office_item_evaluation
    json.url  "
              #{link_to 'Show', office_item_evaluation }
              #{link_to 'Edit', edit_office_item_evaluation_path(office_item_evaluation)}
              #{link_to 'Destroy', office_item_evaluation, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end