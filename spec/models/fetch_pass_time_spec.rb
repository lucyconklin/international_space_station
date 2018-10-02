require 'rails_helper'

describe "Fetch Pass Time PORO" do
  it "initializes with zipcode" do
    zipcode = 80210

    pass_time = FetchPassTime.new(zipcode)

    expect(pass_time.date_of_next_passover.class).to eq(DateOfNextPassover)
    expect(pass_time.timezone.name).to eq("America/Denver")
    expect(pass_time.timestamp).to be_a(Integer)
  end
end
