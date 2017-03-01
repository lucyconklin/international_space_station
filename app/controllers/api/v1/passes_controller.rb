class Api::V1::PassesController < ApplicationController
  def show
    pass_time = FetchPassTime.new(params[:zipcode])
    date = pass_time.date_of_next_passover
    # timestamp = IssService.date_of_next_passover(params[:zipcode])
    # date = DateOfNextPassover.create(date: timestamp)
    # timezone.time(Time.at(date[:date].to_i))
    # date_of_next_passover = date.strftime("%A, %b %d").to_s
    render json: date.format_date
  end
end
