json.set! :data do
  @sn = 1
  json.array! @tenders do |tender|
    json.partial! 'project/tenders/tenders', tender: tender
    json.tender_date "#{ ndate tender.tender_date}"
    if tender.marked_as_final != true
      json.url "
               #{link_to show_btn.html_safe, tender }
               #{link_to edit_btn.html_safe, edit_project_tender_url(tender)}
               #{link_to destroy_btn.html_safe, tender, method: :delete, data: {confirm: 'Are you sure?'}}
               "
    else
      json.url "
               #{link_to show_btn.html_safe, tender }
               "
    end
    json.sn  "#{@sn}"
    @sn = @sn + 1
  end
end