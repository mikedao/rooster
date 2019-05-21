class CohortSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :cohort_id, :status
end
