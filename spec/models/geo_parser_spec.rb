require 'rails_helper'

describe "GeoParser" do
  it "initialzes with zipcode" do
    zipcode = 80120

    geo = GeoParser.new(zipcode)

    expect(geo.zipcode).to eq(80120)
    expect(geo.latitude).to eq(39)
    expect(geo.longitude).to eq(-105)
    expect(geo.timezone.name).to eq("America/Denver")
  end
end
