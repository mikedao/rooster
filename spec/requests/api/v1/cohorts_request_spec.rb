require "rails_helper"

describe "cohorts API" do
  it "sends a list of cohorts" do

    create_list(:cohort, 5)

    get "/api/v1/cohorts/?key=#{ENV['consume_key']}"

    cohorts = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(cohorts[:data].count).to eq(5)

    expect(cohorts[:data].first).to have_key(:id)
    expect(cohorts[:data].first[:attributes]).to have_key(:id)
    expect(cohorts[:data].first[:attributes]).to have_key(:name)
    expect(cohorts[:data].first[:attributes]).to have_key(:cohort_id)
  end

  it "sends a collection of students for a cohort" do
    cohort_1 = Cohort.create(name: "1410", cohort_id: "hamburger")
    cohort_2 = Cohort.create(name: "1801", cohort_id: "totino")

    cohort_1.students << Student.create(name: "Alice", program: "B")
    cohort_1.students << Student.create(name: "Eve", program: "B")
    cohort_1.students << Student.create(name: "Luna", program: "F")
    cohort_1.students << Student.create(name: "Tonks", program: "F")

    cohort_2.students << Student.create(name: "Neville", program: "F")
    cohort_2.students << Student.create(name: "Draco", program: "F")
    cohort_2.students << Student.create(name: "Lavender", program: "F")
    cohort_2.students << Student.create(name: "Lucius", program: "B")
    cohort_2.students << Student.create(name: "Bellatrix", program: "B")

    get "/api/v1/cohorts/1410-b?key=#{ENV['consume_key']}"

    students = JSON.parse(response.body, symbolize_names: true)
    expect(students[:data].count).to eq(2)
    expect(students[:data].first[:attributes][:name]).to eq("Alice")
    expect(students[:data].last[:attributes][:name]).to eq("Eve")

    get "/api/v1/cohorts/1801-f?key=#{ENV['consume_key']}"
    students = JSON.parse(response.body, symbolize_names: true)

    expect(students[:data].first[:attributes][:name]).to eq("Neville")
    expect(students[:data].last[:attributes][:name]).to eq("Lavender")
  end
end

