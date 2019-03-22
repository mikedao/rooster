require "rails_helper"

describe "search student API" do
  it "sends a list of students" do
    cohort_1 = Cohort.create(name: "1410", cohort_id: "hamburger")
    cohort_2 = Cohort.create(name: "1801", cohort_id: "totino")

    cohort_1.students << Student.create(name: "Alice", program: "B")
    cohort_1.students << Student.create(name: "Eve", program: "B")
    cohort_1.students << Student.create(name: "Luna", program: "F")
    cohort_1.students << Student.create(name: "Lunar", program: "F")
    cohort_1.students << Student.create(name: "Tonks", program: "F")

    cohort_2.students << Student.create(name: "Neville", program: "F")
    cohort_2.students << Student.create(name: "Draco", program: "F")
    cohort_2.students << Student.create(name: "Lavender", program: "F")
    cohort_2.students << Student.create(name: "Lucius", program: "B")
    cohort_2.students << Student.create(name: "Bellatrix", program: "B")
    get "/api/v1/search/students/?key=#{ENV['consume_key']}&q=lun"

    students = JSON.parse(response.body, symbolize_names: true)

    expect(students[:data].count).to eq(2)
    expect(students[:data].first[:attributes][:name]).to eq("Luna")
    expect(students[:data].last[:attributes][:name]).to eq("Lunar")
  end
end
