json.extract! purchase_order, :id, :vendor_name, :vendor_address, :vendor_registration, :vendor_phone, :vendor_pan, :order_no, :order_date, :order_decision_no, :order_decision_date, :date_to_receive_goods, :office_name, :office_address
json.url office_purchase_order_url(purchase_order, format: :json)
