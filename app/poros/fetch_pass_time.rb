class FetchPassTime
  attr_reader :timezone, :timestamp
  
  def initialize(zipcode)
    geo = GeoParser.new(zipcode)
    @timezone = geo.timezone
    iss_service = IssService.new
    iss_service.date_of_next_passover(geo.latitude, geo.longitude)
    @timestamp = iss_service.timestamp
    date_of_next_passover
  end

  def date_of_next_passover
    DateOfNextPassover.new(timestamp: @timestamp, timezone: @timezone)
  end
end
