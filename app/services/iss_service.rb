class IssService
  def self.get_current_position
    conn = Faraday.new("http://api.open-notify.org/iss-now.json")
    response = conn.get
    JSON.parse(response.body)
  end

  def self.get_astronauts
    conn = Faraday.new("http://api.open-notify.org/astros.json")
    response = conn.get
    JSON.parse(response.body)
  end

  def self.date_of_next_passover(zipcode)
    coordinates = Geocoder.coordinates(zipcode)
    latitude = coordinates[0].to_i
    longitude = coordinates[1].to_i
    conn = Faraday.new("http://api.open-notify.org")
    response = conn.get "/iss-pass.json?lat=#{latitude}&lon=#{longitude}&n=1"
    timestamp = JSON.parse(response.body)["response"][0]["risetime"]
    Time.at(timestamp)
  end
end
