require 'rails_helper'

describe "Next Passover time API" do
  before do
    conn = Faraday.new("http://api.open-notify.org")
    response = conn.get "/iss-pass.json?lat=39&lon=-105&n=1"
    timestamp = JSON.parse(response.body)["response"][0]["risetime"]
    @date = Time.at(timestamp).strftime("%A, %b %d")
  end

  it 'returns date of next passover' do
    get "/api/v1/pass-time", zipcode: 80120
    
    date = response.body

    expect(date).to eq(@date)
  end
end
