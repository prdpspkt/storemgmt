class Project::PurchaseOrderItem < ApplicationRecord
  belongs_to :purchase_order, class_name: "Project::PurchaseOrder"
  belongs_to :item, class_name: "Project::Item"
end
