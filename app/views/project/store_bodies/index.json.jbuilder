json.set! :data do
  json.array! @store_bodies do |store_body|
    json.partial! 'store_bodies/store_body', store_body: store_body
    json.url  "
              #{link_to 'Show', store_body }
              #{link_to 'Edit', edit_office_store_body_path(store_body)}
              #{link_to 'Destroy', store_body, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end