class Api::V1::Search::StudentsController < ApplicationController
  def index
    if valid_consume_key?(params[:key])
      results = Student.where("name like ?", "%#{params[:q]}%").includes(:cohort)
      render json: StudentSerializer.new(results)
    else
      render body: "Unauthorized", status: 401
    end
  end
end
