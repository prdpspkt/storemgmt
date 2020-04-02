json.set! :data do
  json.array! @item_evaluations do |item_evaluation|
    json.partial! 'office/item_evaluations/evaluation', item_evaluation: item_evaluation
    json.office_name  "#{item_evaluation.office.office}"
    json.fy "#{item_evaluation.fiscal_year.fy}"
    json.description "
                      #{ link_to 'बार्षिक जिन्सी निरीक्षण प्रतिवेदन फाराम', office_item_evaluation_url(item_evaluation)}
                     "
  end
end