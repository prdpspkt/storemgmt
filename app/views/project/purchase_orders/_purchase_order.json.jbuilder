json.extract! purchase_order, :id,  :order_no, :order_date, :order_decision_no, :order_decision_date, :date_to_receive_goods, :office_name, :office_address, :store_chief_signed_date, :section_chief_signed_date, :office_cheif_signed_date
json.url project_purchase_order_url(purchase_order, format: :json)
