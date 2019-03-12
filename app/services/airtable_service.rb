class AirtableService

  def get_cohorts
    get_json("https://api.airtable.com/v0/#{ENV['table_key']}/Cohort?api_key=#{ENV['airtable_key']}")[:records]
  end

  private

  def conn
    Faraday.new("https://api.airtable.com/v0/")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
