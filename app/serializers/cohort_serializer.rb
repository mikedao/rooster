class CohortSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :students
end
