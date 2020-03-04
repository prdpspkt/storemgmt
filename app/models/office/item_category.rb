class Office::ItemCategory < ApplicationRecord
  self.table_name = "office_item_categories"
  has_many :items, class_name: "Office::Item"

  before_destroy :check_items


  def check_items
    if self.items.count > 0
      errors[:base] << "यो वर्गीकरणसँग केहि जिन्सी सामानहरू सम्बन्धित छन कृपया पहिले ति सामान हटाउनुस र पुन प्रयास गर्नुहोस्"
      throw(:abort)
    end
  end
end
