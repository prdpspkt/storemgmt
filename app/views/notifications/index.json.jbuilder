json.set! :data do
	@sn = 1
  json.array! @notifications do |notification|
    json.partial! 'notifications/notification', notification: notification
    json.url  "
              #{link_to destroy_btn.html_safe, notification, method: :delete, data: { confirm: 'Are you sure?' }}
              "
    json.end_date "#{ndate notification.end_date}"
    json.sn "#{@sn}"
    json.created_for "#{User.find(notification.created_for).office.office}"
    @sn = @sn + 1
  end
end