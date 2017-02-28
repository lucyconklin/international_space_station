require 'rails_helper'

describe "User can see next ISS flyover" do
  before do
    conn = Faraday.new("")
    response = conn.get ""
    timestamp = JSON.parse(response.body)["risetime"]
    @date = Time.at(timestamp)
    visit root_path
  end

  it "after entering zipcode on homepage" do
    zipcode = 80120

    fill_in :zipcode, with: zipcode

    expect(current_path).to be root_path
    expect(page).to have_selector(".passover-date")
    expect(page).to have_content(@date)
  end
end
