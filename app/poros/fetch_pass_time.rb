class FetchPassTime
  def initialize(zipcode)
    geo = GeoParser.new(zipcode)
    @timezone = geo.timezone
    iss_service = IssService.new(geo.latitude, geo.longitude)
    @timestamp = iss_service.timestamp
    date_of_next_passover
  end

  def date_of_next_passover
    date = DateOfNextPassover.new(timestamp: @timestamp, timezone: @timezone)
  end
end
