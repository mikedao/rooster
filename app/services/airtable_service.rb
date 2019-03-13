class AirtableService

  def get_cohorts
    get_json("#{ENV['table_key']}/Cohort?api_key=#{ENV['airtable_key']}")[:records]
  end

  def get_students
    get_json("#{ENV['table_key']}/Students?api_key=#{ENV['airtable_key']}")[:records]
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
