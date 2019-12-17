json.set! :data do
  json.array! @pneirts do |pneirt|
    json.partial! 'pneirts/pneirt', pneirt: pneirt
    json.url  "
              #{link_to 'Show', pneirt }
              #{link_to 'Edit', edit_pneirt_path(pneirt)}
              #{link_to 'Destroy', pneirt, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end