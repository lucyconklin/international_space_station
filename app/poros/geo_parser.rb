class GeoParser
  attr_reader :latitude, :longitude, :timezone, :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
    get_coordinates
  end

  def get_coordinates
    coordinates = Geocoder.coordinates(@zipcode)
    @latitude = coordinates[0].to_i
    @longitude = coordinates[1].to_i
    get_timezone
  end

  def get_timezone
    @timezone = Timezone.lookup(@latitude, @longitude)
  end
end
