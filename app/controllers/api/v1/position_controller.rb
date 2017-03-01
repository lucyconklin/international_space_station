class Api::V1::PositionController < ApplicationController
  def show
    response = IssService.new().get_current_position
    render json: response
  end
end
