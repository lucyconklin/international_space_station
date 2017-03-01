class Api::V1::AstronautsController < ApplicationController
  def index
    response = IssService.new().get_astronauts
    render json: response
  end
end
