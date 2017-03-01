class DateOfNextPassover < ApplicationRecord
  attr_reader :format_date

  def format_date
    zone = Timezone.fetch(self.timezone)
    zone.time(Time.at(self.timestamp)).strftime('%A, %d %b %Y %l:%M %p')
  end
end
