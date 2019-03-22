class StudentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :cohort, :program
end
