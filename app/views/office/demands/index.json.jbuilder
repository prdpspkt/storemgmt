json.set! :data do
  json.array! @demands do |demand|
    json.partial! 'office/demands/demand', demand: demand
    json.demand_date "#{ ndate demand.demand_date}"
    json.demand_by "#{demand.personnel.name_ne}"
    json.ordered_by "#{demand.store_body.office_chief_name}"
    json.recorded_by "#{demand.store_body.store_keeper_name}"
    if(demand.marked_as_final != true)
      json.url "#{link_to show_btn.html_safe, demand }
                #{link_to edit_btn.html_safe, edit_office_demand_path(demand)}
                #{link_to destroy_btn.html_safe, demand, method: :delete, data: { confirm: 'Are you sure?' }}
               "
    else
      json.url  " #{link_to show_btn.html_safe, demand } "
    end
  end
end
