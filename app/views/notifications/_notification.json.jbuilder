json.extract! notification, :id, :text, :created_for, :end_date, :expired
json.url notification_url(notification, format: :json)
