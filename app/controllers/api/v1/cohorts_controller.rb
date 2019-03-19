class Api::V1::CohortsController < ApplicationController
  def index
    render json: CohortSerializer.new(Cohort.all)
  end

  def update
    if valid_key?(params[:key])
      DatabaseUpdater.new.update_cohorts!
      render body: "Success", status: 200
    else
      render body: "Unauthorized", status: 401
    end
  end

  private

  def valid_key?(key)
    key == ENV['update_key']
  end
end
