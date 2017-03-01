class Api::V1::RemindersController < ActionController::API
  def create
    reminder = Reminder.create(reminder_params)

    render json: reminder
  end

  private
    def reminder_params
      params.require(:reminder).permit(:timestamp, :phone_number)
    end
end
