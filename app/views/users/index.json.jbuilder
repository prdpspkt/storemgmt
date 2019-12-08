json.set! :data do
  json.array! @users do |user|
    json.partial! 'users/user', user: user
    json.url  "
              #{link_to edit_btn.html_safe, edit_user_path(user)}
              #{link_to destroy_btn.html_safe, user, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end