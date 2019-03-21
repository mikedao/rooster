class Api::V1::CohortsController < ApplicationController
  def index
    if valid_consume_key?(params[:key])
      render json: CohortSerializer.new(Cohort.all)
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

  private

  def valid_update_key?(key)
    key == ENV['update_key']
  end

  def valid_consume_key?(key)
    key == ENV['consume_key']
  end
end
