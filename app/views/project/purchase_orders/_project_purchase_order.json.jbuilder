json.extract! project_purchase_order, :id, :vendor_id, :order_no, :order_date, :order_decision_no, :order_decision_date, :office_name, :office_address
json.url project_purchase_order_url(project_purchase_order, format: :json)
