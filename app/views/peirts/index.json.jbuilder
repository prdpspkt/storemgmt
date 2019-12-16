json.set! :data do
  json.array! @peirts do |peirt|
    json.partial! 'peirts/peirt', peirt: peirt
    json.url  "
              #{link_to 'Show', peirt }
              #{link_to 'Edit', edit_peirt_path(peirt)}
              #{link_to 'Destroy', peirt, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end