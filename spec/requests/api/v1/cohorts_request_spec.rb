require "rails_helper"

describe "cohorts API" do
  it "sends a list of cohorts" do

    create_list(:cohort, 5)

    get '/api/v1/cohorts'

    cohorts = JSON.parse(response.body)
    expect(response).to be_successful
    expect(cohorts["data"].count).to eq(5)
  end

end

