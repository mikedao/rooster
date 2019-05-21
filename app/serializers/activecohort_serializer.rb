class ActivecohortSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :cohort_id, :students, :status
end
