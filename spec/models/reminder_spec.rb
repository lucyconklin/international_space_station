require 'rails_helper'

RSpec.describe Reminder, type: :model do
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:timestamp) }
end
