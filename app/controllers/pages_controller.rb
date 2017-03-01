class PagesController < ApplicationController
  before_action :get_zipcode

  def index
  end

  private
    def get_zipcode
      params[:zipcode]
    end
end
