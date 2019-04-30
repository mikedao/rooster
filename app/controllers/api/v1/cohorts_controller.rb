class Api::V1::CohortsController < ApplicationController
  def index
    if valid_consume_key?(params[:key])
      render json: CohortSerializer.new(Cohort.all)
    else
      render body: "Unauthorized", status: 401
    end
  end

  def active
    if valid_consume_key?(params[:key])
      render json: CohortSerializer.new(Cohort.where(status: "Active"))
    else
      render body: "Unauthorized", status: 401
    end
  end

  def update
    if valid_update_key?(params[:key])
      DatabaseUpdater.new.update_cohorts!
      render body: "Success", status: 200
    else
      render body: "Unauthorized", status: 401
    end
  end

  def show
    if valid_consume_key?(params[:key])
      students = Cohort.find_by(name: cohort).students.where(program: program).includes(:cohort)
      render json: StudentSerializer.new(students)
    else
      render body: "Unauthorized", status: 401
    end
  end

  private

  def valid_update_key?(key)
    key == ENV['update_key']
  end

  def valid_consume_key?(key)
    key == ENV['consume_key']
  end

  def cohort
    params[:id][0..3]
  end

  def program
    params[:id][-1].upcase
  end

end
