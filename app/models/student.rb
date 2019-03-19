class Student < ApplicationRecord
  belongs_to :cohort, primary_key: "cohort_id", foreign_key: "current_cohort", class_name: "Cohort"
end
