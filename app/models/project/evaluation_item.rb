class Project::EvaluationItem < ApplicationRecord
  belongs_to :evaluation, class_name: "Project::Evaluation"
end
