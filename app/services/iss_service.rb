class IssService
  attr_reader :timestamp

  def initialize()
  end

  def get_current_position
    conn = Faraday.new("http://api.open-notify.org/iss-now.json")
    response = conn.get
    JSON.parse(response.body)
  end

  def get_astronauts
    conn = Faraday.new("http://api.open-notify.org/astros.json")
    response = conn.get
    JSON.parse(response.body)
  end

  def date_of_next_passover(latitude, longitude)
    conn = Faraday.new("http://api.open-notify.org")
    response = conn.get "/iss-pass.json?lat=#{latitude}&lon=#{longitude}"
    @timestamp = JSON.parse(response.body)["response"][0]["risetime"]
  end
end
