json.set! :data do
  json.array! @project_releases do |project_release|
    json.partial! 'project_releases/project_release', project_release: project_release
    json.url  "
              #{link_to 'Show', project_release }
              #{link_to 'Edit', edit_project_release_path(project_release)}
              #{link_to 'Destroy', project_release, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end