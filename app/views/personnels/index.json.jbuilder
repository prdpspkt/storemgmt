json.set! :data do
  json.array! @personnels do |personnel|
    json.partial! 'personnels/personnel', personnel: personnel
    json.url  "
              #{link_to 'Show', personnel }
              #{link_to 'Edit', edit_personnel_path(personnel)}
              #{link_to 'Destroy', personnel, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end