class IssService
  def self.get_current_position
    conn = Faraday.new("http://api.open-notify.org/iss-now.json")
    response = conn.get
    JSON.parse(response.body)
  end
end
