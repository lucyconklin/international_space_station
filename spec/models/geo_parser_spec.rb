require 'rails_helper'

describe "GeoParser" do
  it "initialzes with zipcode" do
    zipcode = 80210
    
    geo = GeoParser.new(zipcode)

    expect(geo.zipcode).to eq(80210)
    expect(geo.latitude).to eq(39)
    expect(geo.longitude).to eq(-104)
    expect(geo.timezone.name).to eq("America/Denver")
  end
end
