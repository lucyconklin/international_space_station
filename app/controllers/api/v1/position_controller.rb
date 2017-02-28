class Api::V1::PositionController < ApplicationController
  def show
    response = IssService.get_current_position
    render json: response
  end
end
