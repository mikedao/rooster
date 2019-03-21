class AirtableService

  def get_cohorts
    get_json("#{ENV['table_key']}/Cohort?api_key=#{ENV['airtable_key']}")[:records]
  end

  def get_students
    build_students
  end

  private

  def build_students(results=[], offset=nil)
    if offset.nil?
      response = get_json("#{ENV['table_key']}/Students?api_key=#{ENV['airtable_key']}")

      build_students(response[:records], response[:offset])
    else
      response = get_json("#{ENV['table_key']}/Students?api_key=#{ENV['airtable_key']}&offset=#{offset}")
      results += response[:records]

      if response[:offset]
        build_students(results, response[:offset])
      else
        results
      end
    end
  end


  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.airtable.com/v0/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
