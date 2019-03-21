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

    students = service.get_students
    students.each do |student_data|
      create_student(student_data)
    end
  end


  private

  def service
    @_service ||= AirtableService.new
  end

  def create_student(student_data)
    student = Student.find_by(airtable_id: student_data[:id])
    if student.nil?
      Student.create!(name: student_data[:fields][:🔐Name],
                     starting_cohort: student_data[:fields][:"🔐Starting Cohort"].first,
                     current_cohort: student_data[:fields][:"🔐Current Cohort"].first,
                     program: student_data[:fields][:🔐Program].first
                    ) if valid_student_data?(student_data[:fields])
    else
      student.update!(current_cohort: student_data[:fields][:"🔐Current Cohort"])
    end
  end

  def valid_student_data?(data)
    data[:🔐Name] && data[:"🔐Starting Cohort"].first && data[:"🔐Current Cohort"].first && data[:🔐Program]
  end



end
