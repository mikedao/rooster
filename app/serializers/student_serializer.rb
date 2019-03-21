class StudentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :program do |object|
    if object.program == "B"
      "BEE"
    else
      "FEE"
    end
  end

  attribute :current_cohort do |object|
    object.cohort.name + "-" + object.program
  end
end
