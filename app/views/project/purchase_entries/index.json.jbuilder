@serial = 1
json.set! :data do
  json.array! @purchase_entries do |purchase_entry|
    json.partial! '/project/purchase_entries/purchase_entry', project_purchase_entry: purchase_entry
    if purchase_entry.marked_as_final != true
      json.url "
               #{link_to show_btn.html_safe, purchase_entry }
               #{link_to edit_btn.html_safe, edit_project_purchase_entry_path(purchase_entry) }
               #{link_to destroy_btn.html_safe, purchase_entry, data: {method: :delete, confirm: "Are you sure ?"}}"
    else
      json.url "
               #{link_to show_btn.html_safe, purchase_entry}
               "
    end
    json.serial "
                #{  @serial}
                "
    json.form_name ""
    json.order_no ""
    if purchase_entry.tender_id.present?
      json.form_name "#{purchase_entry.tender.bidders_name}"
      json.order_no "ठे.नं. #{purchase_entry.tender.tender_no}"
    else
      unless purchase_entry.purchase_order.blank?
          json.form_name "#{purchase_entry.purchase_order.vendor.vendor_name}"
          json.order_no "ख.आ. नं. #{purchase_entry.purchase_order.order_no}"
       end       
    end
    json.entry_date "#{ ndate purchase_entry.entry_date}"
    json.entry_no "#{ nd purchase_entry.entry_no}"
    @serial = @serial + 1
  end
end