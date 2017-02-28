require 'rails_helper'

describe "ISS position API" do
  before do
    conn = Faraday.new(:url => 'http://api.open-notify.org')
    response = conn.get '/iss-now.json'
    test_data = JSON.parse(response.body)
    @longitude = test_data["iss_position"]["longitude"]
    @latitude = test_data["iss_position"]["latitude"]
  end

  it "returns lat and long for ISS" do
    get "/api/v1/iss-position"

    position = JSON.parse(response.body)

    expect(position["iss_position"]["latitude"]).to eq(@latitude)
    expect(position["iss_position"]["longitude"]).to eq(@longitude)
  end
end
