class Api::V1::CohortsController < ApplicationController
  def index
    render json: CohortSerializer.new(Cohort.all)
  end
end
