class DatabaseUpdater
  def update_cohorts!
    cohorts = service.get_cohorts
    cohorts.each do |cohort_data|
      cohort = Cohort.where(name: cohort_data[:fields][:Name],
                            cohort_id: cohort_data[:id])
        .first_or_create do |c|
          c.name = cohort_data[:fields][:Name]
          c.cohort_id = cohort_data[:id]
      end
    end
  end

  private

  def service
    @_service ||= AirtableService.new
  end
end
