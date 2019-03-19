class Cohort < ApplicationRecord
  has_many :students, primary_key: "cohort_id", foreign_key: "current_cohort", class_name: "Student"
end
