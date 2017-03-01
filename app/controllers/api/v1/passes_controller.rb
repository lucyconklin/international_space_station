class Api::V1::PassesController < ApplicationController
  def show
    pass_time = FetchPassTime.new(params[:zipcode])
    date = pass_time.date_of_next_passover
    if date.save
      render json: date
    else
      render json: error
    end
  end
end
