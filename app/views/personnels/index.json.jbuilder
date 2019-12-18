json.set! :data do
  json.array! @personnels do |personnel|
    json.partial! 'personnels.html.erb/personnel', personnel: personnel
    json.url  "
              #{link_to show_btn.html_safe, personnel }
              #{link_to edit_btn.html_safe, edit_personnel_path(personnel)}
              #{link_to destroy_btn.html_safe, personnel, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end