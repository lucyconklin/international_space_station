class Api::V1::RemindersController < ActionController::API
  def create
    reminder = Reminder.create(reminder_params)

    # this should actually be setting the timestamp from a session?
    # right now it is setting a timestamp without knowing the timezone
    # timestamp is not the tru unix timestamp
    # reminder = Reminder.create(phone_number: params['phone_number'], timestamp: session[:timestamp])

    render json: reminder
  end

  private
    def reminder_params
      params.require(:reminder).permit(:timestamp, :phone_number)
    end
end
