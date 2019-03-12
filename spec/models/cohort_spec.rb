require 'rails_helper'

RSpec.describe Cohort, type: :model do
  it "has atrributes" do
    cohort = create(:cohort)

    expect(cohort.name).to eq("1")
    expect(cohort.cohort_id).to eq("blah1")
  end
end
