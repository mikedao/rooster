require 'rails_helper'

RSpec.describe Cohort, type: :model do
  it "has atrributes" do
    cohort = Cohort.new(name: "1410", cohort_id: "asdasda123")

    expect(cohort.name).to eq("1410")
    expect(cohort.cohort_id).to eq("asdasda123")
  end

  it "can have other attributes" do
    cohort = Cohort.new(name: "1406", cohort_id: "hamburger1")

    expect(cohort.name).to eq("1406")
    expect(cohort.cohort_id).to eq("hamburger1")
  end
end
