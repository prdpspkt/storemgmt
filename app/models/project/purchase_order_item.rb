class Project::PurchaseOrderItem < ApplicationRecord
  belongs_to :purchase_order, class_name: "Project::PurchaseOrder"
end
