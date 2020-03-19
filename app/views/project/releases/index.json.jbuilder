json.set! :data do
  json.array! @office_releases do |office_release|
    json.partial! 'office/releases/office_release', office_release: office_release
    if office_release.marked_as_final == true || office_release.entry_generated == true
      json.release_date "#{ ndate office_release.release_date}"
      json.url "
               #{link_to show_btn.html_safe, office_release }
               "
    else
      json.url "
               #{link_to show_btn.html_safe, office_release }
               #{link_to edit_btn.html_safe, edit_office_release_path(office_release)}
               #{link_to destroy_btn.html_safe, office_release, method: :delete, data: {confirm: 'Are you sure?'}}
               "
    end
    end
  end