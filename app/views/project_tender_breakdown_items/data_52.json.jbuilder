json.set! :data do
  json.array! @items do |project_item|
    json.partial! 'project_items/project_item', project_item: project_item
  end
end