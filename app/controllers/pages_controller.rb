class PagesController < ApplicationController
  before_action :get_zipcode
  def index
    @date_of_next_passover = IssService.date_of_next_passover(@zipcode)
  end

  private
    def get_zipcode
      params[:zipcode]
    end
end
