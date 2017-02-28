require 'rails_helper'

describe "People In Space API" do
  before do
    conn = Faraday.new(:url => 'http://api.open-notify.org')
    response = conn.get '/astros.json'
    @people = JSON.parse(response.body)
    @person = @people.first
  end

  it "returns people in space" do
    get "/api/v1/astronauts"

    astronauts = JSON.parse(response.body)

    expect(astronauts.count).to eq(@people.count)
    expect(astronauts.first).to eq(@person)
  end
end
