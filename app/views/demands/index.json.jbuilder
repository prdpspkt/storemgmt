json.set! :data do
  json.array! @demands do |demand|
    json.partial! 'demands/demand', demand: demand
    json.url  "
              #{link_to show_btn.html_safe, demand }
              #{link_to edit_btn.html_safe, edit_demand_path(demand)}
              #{link_to destroy_btn.html_safe, demand, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end