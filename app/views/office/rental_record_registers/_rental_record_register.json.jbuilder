json.extract! rental_record_register, :id, :is_taken_in_rent, :is_given_in_rent, :item_register_page_no
json.url office_rental_record_register_url(rental_record_register, format: :json)
