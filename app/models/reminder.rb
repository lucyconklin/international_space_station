class Reminder < ApplicationRecord
  validates :timestamp, presence: true
  validates :phone_number, presence: true

  after_create :reminder

  @@REMINDER_TIME = 5.minutes

  def reminder
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    time_str = ((self.timestamp).localtime).strf("%I:%M%p on %b. %d, %Y")
    reminder = "The space station will be passing over your location in about 5 minutes. Look up!"
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone_number,
      :body => reminder,
    )
    puts message.to
  end

  def when_to_run
    timestamp - @@REMINDER_TIME
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
