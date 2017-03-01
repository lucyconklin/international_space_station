class Api::V1::PassesController < ApplicationController
  def show
    date = IssService.date_of_next_passover(params[:zipcode])
    date_of_next_passover = date.strftime("%A, %b %d")
    render json: date_of_next_passover
  end
end
