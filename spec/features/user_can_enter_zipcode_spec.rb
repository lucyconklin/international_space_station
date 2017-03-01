require 'rails_helper'

describe "User can see next ISS flyover" do
  before do
    conn = Faraday.new("http://api.open-notify.org")
    response = conn.get "/iss-pass.json?lat=39&lon=-105&n=1"
    timestamp = JSON.parse(response.body)["response"][0]["risetime"]
    @date = Time.at(timestamp).strftime("%A, %b %d")
    visit root_path
  end

  xit "after entering zipcode on homepage" do
    zipcode = 80120

    fill_in "fetch-passover", with: zipcode
    find('#zipcode-submit').click

    expect(current_path).to eq root_path
    expect(page).to have_selector(".passover-date")
    expect(page).to have_content(@date)
  end

  xit "displays nothing for an invalid input" do
    zipcode = "cats"

    fill_in "fetch-passover", with: zipcode
    find('#zipcode-submit').click

    expect(current_path).to eq root_path
    expect(page).to have_content("unknown...try a nearby zipcode")
  end
end
