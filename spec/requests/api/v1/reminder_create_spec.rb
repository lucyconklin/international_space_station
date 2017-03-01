require 'rails_helper'

describe 'Reminder API' do
  before do
    @reminder = Reminder.new(timestamp: Time.now.to_i, phone_number: "555555555")
  end

  it 'creates a new reminder' do
    post "/api/v1/reminders", params: { reminder: { timestamp: @reminder.timestamp,
                                          phone_number: @reminder.phone_number }
                                        }
    expect(Reminder.count).to eq(1)
  end
end
